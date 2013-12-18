'use strict';

angular.module('ngCorsApp')
  .controller('YeomanCtrl', function ($scope) {
    $scope.commands = [
      'grunt serve',
      'grunt build',
      'grunt test'
    ];
  });
