app.directive("solutionsForm", function($http, $location){
    return {
        // scope: {
        //     policy: "=",
        //     problemId: "=", 
        //     solutions : "@"
        // },
        restrict: "E",
        templateUrl: "/solutions/aside_form",
        controller: function($scope, $http){
            $scope.solutions = [];
            $scope.problem_id = $location.search().problem_id

            $http.get("/real_problems/"+$scope.problem_id+"/policy_problems/"+$scope.policy.id+"/solutions.json")
            .success(function(data){
                $scope.solutions = data;
            })
            $scope.current_solution = {title: "", description: ""};

            $scope.save_or_update_solution = function(){
                //if
                if($scope.current_solution.id) {
                    $http.put("/real_problems/"+$scope.problem_id+"/policy_problems/"+$scope.policy.id+"/solutions/"+$scope.current_solution.id, $scope.current_solution).
                    success(function(data){
                        $scope.solution_button_txt = "Add Solution";
                    });
                } else {
                    $http.post("/real_problems/"+$scope.problem_id+"/policy_problems/"+$scope.policy.id+"/solutions", $scope.current_solution)
                    .success(function(data){
                        $scope.solutions.push(data)
                    })
                }
                $scope.current_solution = {title: "", description: ""};
            }

            // solution
            $scope.edit_solution = function(solution){
              $scope.solution_button_txt = "Edit Solution";
              $scope.current_solution = solution;
            }

        }
    }
});

app.directive("solutionsList", function($http){
    return {
        scope: {
            problemId: "=",
            policy: "="
        },
        restrict: "E",
        templateUrl: "/solutions/list",
        controller: function($scope, $http){
            $scope.solutions = [];
            $http.get("/real_problems/"+$scope.problemId+"/policy_problems/"+$scope.policy.id+"/solutions.json")
            .success(function(data){
                $scope.solutions = data;
            })
        }
    }
});