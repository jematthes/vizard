app.controller("step1Ctrl", function($scope, $http, $location, $timeout, $aside){
    $scope.current_step = 1;
    $scope.focus_areas = [
        "Poverty and hunger",
        "Universal primary education",
        "Gender equality and empowerment of women",
        "Child mortality",
        "Maternal health",
        "HIV/AIDS, malaria and other diseases",
        "Environmental sustainability",
        "Global partnership"
    ];
    $scope.policy_button_txt = "Add Policy Problem";

    $scope.problem = {title: "", description: "", focus_area: ""};
    $scope.policies = []
    $scope.current_policy = {title: "", description: ""};
    $scope.problem_id = $location.search().problem_id

    if($scope.problem_id){
        $http.get('/real_problems/'+$location.search().problem_id+'.json')
        .success(function(data){
            $scope.problem = data;
        })
        $http.get('/real_problems/'+$location.search().problem_id+'/policy_problems.json')
        .success(function(data){
            $scope.policies = data;
        })
    }

    var save_or_update_problem = function(){
        if($scope.problem.title == "")
            return

        if($scope.problem.id){
            $http.put("/real_problems/"+$scope.problem.id, $scope.problem)
            .success(function(data){
                // alertar en caso de success o error
            })
        }else{
            $http.post("/real_problems", $scope.problem)
            .success(function(data){
                $scope.problem = data;
                $location.path("/steps/step1").search({problem_id:$scope.problem.id})
                // alertar en caso de success o error
            })
        }
    }

    var save_or_update_policy = function(){
        // if($scope.problem.title == "")
        //     return
        if($scope.current_policy.id){
            $http.put("/real_problems/"+$scope.problem.id+"/policy_problems/"+$scope.current_policy.id, $scope.current_policy)
            .success(function(data){
                // alertar en caso de success o error
                $scope.policy_button_txt = "Add Policy Problem";
            })
        }else{
            $http.post("/real_problems/"+$scope.problem.id+"/policy_problems", $scope.current_policy)
            .success(function(data){
                $scope.policies.push(data);
                // $scope.current_policy = data;
                //agregar el id del policy a la ruta, para edición
                // $location.path("/steps/step1_1").search({problem_id:$scope.problem.id, policy_id:$scope.current_policy.id})
                // alertar en caso de success o error
            })
        }
    }

    var timeoutPromise;
    $scope.$watch("problem", function(new_value, old_value){
        $timeout.cancel(timeoutPromise);
        timeoutPromise = $timeout(function(){
            save_or_update_problem();
        }, 1500);
    }, true);

    $scope.add_policy = function(){
        save_or_update_policy();
        $scope.current_policy = {title: "", description: ""};
    }

    $scope.add_solution = function(policy){
        openAside(policy, 'left', true)
    }
    // policy dimensions
    $scope.e_policy_dimension = function(current_policy) {
        $scope.policy_button_txt = "Edit Policy Problem";
        $scope.current_policy = current_policy;
    }

    // Aside

    $scope.asideState = {
      open: false
    };
    
    var openAside = function(policy, position, backdrop) {
      $scope.asideState = {
        open: true,
        position: position
      };

      function postClose() {
        $scope.asideState.open = false;
      }

      var problem_id = $scope.problem_id;

      $aside.open({
        templateUrl: '/solutions/aside',
        placement: position,
        size: 'lg',
        backdrop: backdrop,
        controller: function($scope, $modalInstance) {
          $scope.solution_button_txt = "Add Solution";
          $scope.policy = policy;
          $scope.problem_id = problem_id;
          $scope.ok = function(e) {
            $modalInstance.close();
            e.stopPropagation();
          };
          $scope.cancel = function(e) {
            $modalInstance.dismiss();
            e.stopPropagation();
          };
        }
      }).result.then(postClose, postClose);
    }

});
