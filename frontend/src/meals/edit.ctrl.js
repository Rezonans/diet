'use strict';

/* Controllers */

angular.module('app').controller('MealEditCtrl', function($scope, $modalInstance, meal) {
  $scope.ok = ok;
  $scope.cancel = cancel;
  $scope.open = open;
  $scope.meal = meal.clone();

  function ok() {
    $scope.meal.save().then(function(meal) {
      $modalInstance.close(meal);
    });
  }

  function cancel() {
    $modalInstance.dismiss();
  }

  function open($event) {
    $event.preventDefault();
    $event.stopPropagation();

    $scope.opened = true;
  }
});
