'use strict';

/* Controllers */

angular.module('app').controller('CreateMealCtrl', function($scope, $modalInstance) {
  $scope.ok = ok;
  $scope.cancel = cancel;
  $scope.open = open;
  $scope.meal = {};
  $scope.meal.datetime = new Date();

  $scope.$watch('meal.date', function (newVal) {
    if (!newVal) return;
    $scope.meal.datetime.setDate(newVal.getDate());
    $scope.meal.datetime.setMonth(newVal.getMonth());
    $scope.meal.datetime.setFullYear(newVal.getFullYear());
  });

  $scope.$watch('meal.time', function (newVal) {
    if (!newVal) return;
    $scope.meal.datetime.setHours(newVal.getHours());
    $scope.meal.datetime.setMinutes(newVal.getMinutes());
    $scope.meal.datetime.setSeconds(newVal.getSeconds());
  });

  function ok() {
    $modalInstance.close($scope.meal);
  }

  function cancel() {
    $modalInstance.dismiss('cancel');
  }

  function open($event) {
    $event.preventDefault();
    $event.stopPropagation();

    $scope.opened = true;
  }
});
