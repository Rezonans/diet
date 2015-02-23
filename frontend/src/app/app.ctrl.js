'use strict';

/* Controllers */

angular.module('app').controller('AppCtrl', function($scope, $auth, $http) {

  $http.get('api/calories').then(function(calories) {
    $scope.labels = _.pluck(calories.data, "date_only");
    $scope.data = [_.pluck(calories.data, "calories_sum")];
  });

  $scope.logout = logout;

  function logout() {
    $auth.logout();
  }
});
