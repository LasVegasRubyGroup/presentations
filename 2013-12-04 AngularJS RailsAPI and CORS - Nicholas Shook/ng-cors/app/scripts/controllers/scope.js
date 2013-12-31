'use strict';

angular.module('ngCorsApp')
.controller('ScopeCtrl', function ($scope) {
  $scope.awesome_group = 'Las Vegas Ruby Group'
  $scope.person = '';
  $scope.nick = /^nick$/i;
});
