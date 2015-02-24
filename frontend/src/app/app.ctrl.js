'use strict';

/* Controllers */

angular.module('app').controller('AppCtrl', function($scope, $auth, CurrentUser) {

  $scope.logout = logout;

  function logout() {
    CurrentUser.reset();
    $auth.logout();
  }
});
