'use strict';

/* Controllers */

angular.module('app').controller('MealEditCtrl', function($scope, $modalInstance, meal) {
  $scope.ok = ok;
  $scope.cancel = cancel;
  $scope.meal = meal.clone();

  function ok() {
    $scope.meal.save().then(function(meal) {
      $modalInstance.close(meal);
    });
  }

  function cancel() {
    $modalInstance.dismiss();
  }
});
