'use strict';

angular.module('ngCorsApp')
.controller('CORSCtrl', ['$scope', '$http', function ($scope, $http) {
  $http.defaults.xDomain = true;
  $scope.password = '';
  $scope.checkPassword = function (password) {
    $http({method: 'POST', url: 'http://ng-cors-api.herokuapp.com/secret', params: {password: password}}).
    success(function(response) {
      console.log('success');
      console.log(response);
    }).
      error(function(response) {
      console.log('failed');  
      console.log(response);
    })};
}]);
