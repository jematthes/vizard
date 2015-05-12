var app = angular.module("wizard-steps", ["ui.bootstrap", 'ng-rails-csrf', 'ngRoute', 'ngAside']);

app.config(['$routeProvider', '$locationProvider', function AppConfig($routeProvider, $locationProvider) {
 $locationProvider.html5Mode(true);
}]);