function adjustVertices(graph, cell) {
// debugger
    // If the cell is a view, find its model.
    cell = cell.model || cell;

    if (cell instanceof joint.dia.Element) {

        _.chain(graph.getConnectedLinks(cell)).groupBy(function(link) {
            // the key of the group is the model id of the link's source or target, but not our cell id.
            return _.omit([link.get('source').id, link.get('target').id], cell.id)[0];
        }).each(function(group, key) {
            // If the member of the group has both source and target model adjust vertices.
            if (key !== 'undefined') adjustVertices(graph, _.first(group));
        });

        return;
    }

    // The cell is a link. Let's find its source and target models.
    var previous = cell.previous()
    var srcId
    var trgId
    if(previous){
        var srcId = cell.get('source').id || cell.previous('source').id;
        var trgId = cell.get('target').id || cell.previous('target').id;
    }
    else{
        var srcId = cell.get('source').id;
        var trgId = cell.get('target').id;
    }

    // If one of the ends is not a model, the link has no siblings.
    if (!srcId || !trgId) return;

    var siblings = _.filter(graph.getLinks(), function(sibling) {

        var _srcId = sibling.get('source').id;
        var _trgId = sibling.get('target').id;

        return (_srcId === srcId && _trgId === trgId) || (_srcId === trgId && _trgId === srcId);
    });

    switch (siblings.length) {

    case 0:
        // The link was removed and had no siblings.
        break;

    case 1:
        // There is only one link between the source and target. No vertices needed.
        cell.unset('vertices');
        break;

    default:

        // There is more than one siblings. We need to create vertices.

        // First of all we'll find the middle point of the link.
        var srcCenter = graph.getCell(srcId).getBBox().center();
        var trgCenter = graph.getCell(trgId).getBBox().center();
        var midPoint = g.line(srcCenter, trgCenter).midpoint();

        // Then find the angle it forms.
        var theta = srcCenter.theta(trgCenter);

        // This is the maximum distance between links
        var gap = 20;

        _.each(siblings, function(sibling, index) {

            // We want the offset values to be calculated as follows 0, 20, 20, 40, 40, 60, 60 ..
            var offset = gap * Math.ceil(index / 2);

            // Now we need the vertices to be placed at points which are 'offset' pixels distant
            // from the first link and forms a perpendicular angle to it. And as index goes up
            // alternate left and right.
            //
            //  ^  odd indexes 
            //  |
            //  |---->  index 0 line (straight line between a source center and a target center.
            //  |
            //  v  even indexes
            var sign = index % 2 ? 1 : -1;
            var angle = g.toRad(theta + sign * 90);

            // We found the vertex.
            var vertex = g.point.fromPolar(offset, angle, midPoint);

            sibling.set('vertices', [{ x: vertex.x, y: vertex.y }]);
        });
    }
};

var myAdjustVertices = _.partial(adjustVertices, graph);

// adjust vertices when a cell is removed or its source/target was changed
graph.on('add remove change:source change:target', myAdjustVertices);
// also when an user stops interacting with an element.
paper.on('cell:pointerup', myAdjustVertices);

$(function(){
    var btn_sidebar_right = "#btn-inspector-container",
        sidebar_right = "#inspector-container",
        btn_sidebar_left = "#btn-sidebar-left", 
        sidebar_left = "#sidebar-left",
        paper_container = "#paper-container";

    $(btn_sidebar_right).on('click', function(){
      if ( $(sidebar_right).css('width') == '300px' ) {
        $(sidebar_right).css('display','none');
        $(paper_container).css('right','0px');
        $(sidebar_right).css('width','0px');
        $(this).css('width','40px');
        $('#btn-right').css('-webkit-transform','rotate(180deg)').css('transform','rotate(180deg)');
      } else {
        $(sidebar_right).css('display','block');
        $(paper_container).css('right','300px');
        $(sidebar_right).css('width','300px');
        $(this).css('width','340px');
        $('#btn-right').css('-webkit-transform','rotate(0deg)').css('transform','rotate(0deg)');
      }
    });

    $(btn_sidebar_left).on('click', function(){
      if ( $(this).css('left') == '300px' ) {
        $(this).css('left','0px');
        $(sidebar_left).css('display','none');
        $(paper_container).css('left','0px');
        $('#btn-left').css('-webkit-transform','rotate(180deg)').css('transform','rotate(180deg)');
      } else {
        $(this).css('left','300px');
        $(sidebar_left).css('display','block');
        $(paper_container).css('left','300px');
        $('#btn-left').css('-webkit-transform','rotate(0deg)').css('transform','rotate(0deg)');
      }
    });

    $(sidebar_right).css('display','none');
    $(paper_container).css('right','0px');
    $(sidebar_right).css('width','0px');
    $(btn_sidebar_right).css('width','40px');
    $('#btn-right').css('-webkit-transform','rotate(180deg)').css('transform','rotate(180deg)');

    $('#stencil-container .element.bpmn.Person').attr('transform','translate(12,198.5)');
    $('#stencil-container .element.bpmn.Organization').attr('transform','translate(12,258.5)');

    var doc_name = $('#fileName a').html();
    $('<style>@media print { body:before { content: "'+doc_name+'" } }</style>').appendTo('head');
    
    var el_zoomin = document.getElementById('btn-zoom-in'),
        el_zoomout = document.getElementById('btn-zoom-out');

    if( el_zoomin ) {

        el_zoomin.addEventListener('click', function(){
            if( paperScroller._sy > '1.2') {
                graph.get('cells').each(function(cell) {
                    if(cell instanceof joint.shapes.bpmn.Person) {
                        cell.zoom_in();
                    }
                });
            }

            if( paperScroller._sy >= '0.8') {
                graph.get('cells').each(function(cell) {
                    if(cell instanceof joint.shapes.bpmn.Step) {
                        cell.zoom_in();
                    }
                    if(cell instanceof joint.shapes.bpmn.GroupOrganization) {
                        cell.zoom_in()
                    }
                })
            }
        })

        el_zoomout.addEventListener('click', function(){
            if( paperScroller._sy <= '1.2') {
                graph.get('cells').each(function(cell) {
                    if(cell instanceof joint.shapes.bpmn.Person) {
                        cell.zoom_out();
                    }
                });
            }

            if( paperScroller._sy < '0.8') {
                graph.get('cells').each(function(cell) {
                    if(cell instanceof joint.shapes.bpmn.Step) {
                        cell.zoom_out();
                    }
                    if(cell instanceof joint.shapes.bpmn.GroupOrganization) {
                        cell.zoom_out()
                    }
                })
            }
        })
    }

    //https://browser-update.org/
    var $buoop = {c:2}; 
    function $buo_f(){ 
        var e = document.createElement("script"); 
        e.src = "//browser-update.org/update.js"; 
        document.body.appendChild(e);
    };
    try {document.addEventListener("DOMContentLoaded", $buo_f,false)}
    catch(e){window.attachEvent("onload", $buo_f)}
    //end
});

//https://www.reddit.com/r/chrome/comments/27mft7/how_do_i_prevent_backspace_from_going_back_a_page/
window.addEventListener('keydown',function(e){if(e.keyIdentifier=='U+0008'||e.keyIdentifier=='Backspace'){if(e.target==document.body){e.preventDefault();}}},true);


//window.onbeforeunload = function(e) {
//    return 'Remember save before exit'
//};