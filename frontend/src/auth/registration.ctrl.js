'use strict';

/* Controllers */

angular.module('app').controller('AuthRegistrationCtrl', function($scope, $auth) {
  $scope.user = {};
  $scope.submit = function() {
    $auth.signup({user: $scope.user}).catch(function (response) {
      $scope.errors = response.data.errors;
    });
  };
});
