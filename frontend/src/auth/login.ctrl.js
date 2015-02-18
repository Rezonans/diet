'use strict';

/* Controllers */

angular.module('app').controller('AuthLoginCtrl', function($scope, $auth) {
  $scope.user = {};
  $scope.submit = function() {
    $scope.errors = {};

    $auth.login({user: $scope.user}).catch(function (response) {
      if (response.data) {
        $scope.errors = response.data.errors;
      }
    });
  };
});
