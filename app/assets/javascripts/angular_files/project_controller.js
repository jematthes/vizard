app.controller("projectCtrl", ["$scope", "$http", "$aside", "$location", function ($scope, $http, $aside, $location) {

  $scope.projects = [];
  $scope.current_project = { title: "", description: "", focus_area: "", public: false };
  $scope.focus_areas = [];

  $http.get('/real_problems/focus_area.json')
    .success(function (data) {
      $scope.focus_areas = data
    });

  function get_projects() {
    $http.get('/projects.json')
      .success(function (data){
        $scope.projects = data;
      })
  }

  get_projects();

  function save_or_update_project() {

    if( $scope.current_project.id ) {
      $http.put('/projects/' + $scope.current_project.id, $scope.current_project)
        .success(function (data){

        });
    } else {
      $http.post('/projects', $scope.current_project)
        .success(function (data){

        });
    }

    get_projects();
  }

  $scope.add_edit_project = function(project) {
    if( project ) {
      $http.get("/projects/" + project.id + ".json")
        .success(function (data) {
          $scope.current_project = data;
        })
    } else {
      $scope.current_project = { title: "", description: "", focus_area: "", public: false };
    }

    $aside.open({
      templateUrl: 'project-aside.html',
      placement: 'left',
      size: 'lg',
      scope: $scope,
      controller: function ($scope, $modalInstance) {
        $scope.save = function (e) {
          save_or_update_project();
          $modalInstance.dismiss();
          e.stopPropagation();
        }
        $scope.cancel = function (e) {
          $modalInstance.dismiss();
          e.stopPropagation();
        };
      }
    });
  }

  $scope.delete_project = function (project){
    if( project ) {
      if(confirm('Are you sure you want to delete this project?')) {
        $http.delete('/projects/' + project.id);
        get_projects();
      }
    }
  }

}])