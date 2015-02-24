'use strict';

/* Controllers */

angular.module('app').controller('MealCreateCtrl', function($scope, $modalInstance, Restangular) {
  $scope.ok = ok;
  $scope.cancel = cancel;
  $scope.meal = {
    time: new Date()
  };

  function ok() {
    Restangular.all('meals').post($scope.meal).then(function(meal) {
      $modalInstance.close(meal);
    });
  }

  function cancel() {
    $modalInstance.dismiss();
  }
});
