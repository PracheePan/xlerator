var app = angular.module('crudApp',['ui.router','ngStorage']);

app.constant('urls', {
    BASE: 'http://localhost:8080/spring-boot-web-jsp-angular',
    EMPLOYEE_SERVICE_API : 'http://localhost:9999/ennoapp/api/user/'
});

app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: 'partials/list',
                controller:'EmployeeController',
                controllerAs:'ctrl',
                resolve: {
                    employees: function ($q, EmployeeService) {
                        console.log('Load all users');
                        var deferred = $q.defer();
                        EmployeeService.loadAllEmployees().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            });
        $urlRouterProvider.otherwise('/');
    }]);

