'use strict';

/* Controllers */

angular.module('app').controller('AppCtrl', function($scope, $auth) {

  $scope.logout = logout;

  function logout() {
    $auth.logout();
  }
});
