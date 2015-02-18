'use strict';

/* Controllers */

angular.module('app').controller('MealsCtrl', function($scope, $modal) {
  $scope.meals = [{
    datetime: new Date(),
    text: 'text',
    calories: 10
  }, {
    datetime: new Date(),
    text: 'text',
    calories: 20
  }, {
    datetime: new Date(),
    text: 'text2',
    calories: 30
  }];

  $scope.addMeal = addMeal;

  function addMeal() {
    var modalInstance = $modal.open({
      templateUrl: 'meals/create-meal.html',
      controller: 'CreateMealCtrl'
    });

    modalInstance.result.then(function (meal) {
      $scope.meals.push(meal);
    }, function () {
      //$log.info('Modal dismissed at: ' + new Date());
    });
  }
});
