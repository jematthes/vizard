app.controller("step4Ctrl", function($scope, $http){
	$scope.outcomes = [];
	$scope.current_outcome = {title: "", description: "", objective_id:0, outcome_type_id: 0, actor_type_id: 0}

	//get all outcomes for a objective
	var get_outcomes = function() {
		$http.get("/objectives/1/outcomes.json")
			.success(function(data){
				$scope.outcomes = data;
			})
	}

	get_outcomes();

	$scope.send_outcome_form = function(){
		$scope.current_outcome.title = "a title";
		$scope.current_outcome.objective_id = 1;
		save_or_update();
		$scope.current_outcome = {title: "", description: "", objective_id:0, outcome_type_id: 0, actor_type_id: 0}
	}

	function save_or_update(){
		if($scope.current_outcome.description == "")
            return
        
        $http.post("/objectives/1/outcomes", $scope.current_outcome)
			.success(function(data){
		      	// alertar en caso de success o error
		      	$scope.outcomes.push(data);
	  		})
	}

	$scope.edit_outcome = function(outcome_id) {
		if(!outcome_id || outcome_id !== parseInt(outcome_id))
			return
		$http.get('/objectives/1/outcomes/'+outcome_id+'.json')
			.success(function(data){
				$scope.current_outcome = data
			})
	}

	$scope.delete_outcome = function(outcome_id) {
		if(!outcome_id || outcome_id !== parseInt(outcome_id))
			return
		$http.delete('/objectives/1/outcomes/'+outcome_id+'.json')
			.success(function(data){
				get_outcomes();
			})
	}
})