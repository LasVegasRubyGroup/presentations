'use strict';

angular.module('ngCorsApp', [
  'ngCookies',
  'ngSanitize',
  'ui.router',
  'hljs'
])
.run(['$rootScope', '$state', '$stateParams', function ($rootScope, $state, $stateParams) {
  $rootScope.$state = $state;
  $rootScope.$stateParams = $stateParams
}])
.config(['$httpProvider','$locationProvider', '$stateProvider', '$urlRouterProvider', function ($httpProvider, $locationProvider, $stateProvider, $urlRouterProvider) {
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
  $locationProvider.html5Mode(true).hashPrefix('#');
  $urlRouterProvider.otherwise('/');
  $stateProvider
  .state('root', {
    url: '/',
    templateUrl: '/views/main.html',
    controller: 'MainCtrl'
  })
  .state('why', {
    url: '/why',
    templateUrl: '/views/why.html',
  })
  .state('view_scope_server', {
    url: '/view_scope_server',
    templateUrl: '/views/view_scope_server.html'
  })
  .state('scope', {
    url: '/scope',
    templateUrl: '/views/scope.html',
    controller: 'ScopeCtrl'
  })
  .state('filters', {
    url: '/filters',
    templateUrl: '/views/filters.html',
    controller: 'FiltersCtrl'
  })
  .state('routing', {
    url: '/routing',
    templateUrl: '/views/routing.html',
    controller: 'RoutingCtrl'
  })
  .state('directives', {
    url: '/directives',
    templateUrl: '/views/directives.html',
    controller: 'DirectivesCtrl'
  })
  .state('yeoman', {
    url: '/yeoman',
    templateUrl: '/views/yeoman.html',
    controller: 'YeomanCtrl'
  })
  .state('CORS', {
    url: '/CORS',
    templateUrl: '/views/CORS.html',
    controller: 'CORSCtrl'
  })
  .state('CORS.password', {
    url: '/password',
    templateUrl: '/views/CORS.password.html'
  })
  .state('CORS.rails', {
    url: '/rails',
    templateUrl: '/views/CORS.rails.html'
  })
  .state('epilogue', {
    url: '/epilogue',
    templateUrl: '/views/epilogue.html',
    controller: 'EpilogueCtrl',
  })
}]);
