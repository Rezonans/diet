'use strict';

/* Controllers */

angular.module('app').controller('MealsIndexCtrl', function($scope, $modal, Restangular) {
  $scope.meals = [];

  Restangular.all('meals').getList().then(function(meals) {
    $scope.meals = meals;
  });

  $scope.addMeal = addMeal;
  $scope.editMeal = editMeal;
  $scope.deleteMeal = deleteMeal;

  function addMeal() {
    $modal.open({
      templateUrl: 'meals/create.html',
      controller: 'MealCreateCtrl'
    }).result.then(function(model) {
      $scope.meals.push(model);
    });
  }

  function editMeal(meal) {
    $modal.open({
      templateUrl: 'meals/create.html',
      controller: 'MealEditCtrl',
      resolve: {
        meal: function() { return meal; }
      }
    }).result.then(function(model) {
        _.assign(meal, model.plain());
    });
  }

  function deleteMeal(meal) {
    meal.remove().then(function() {
      _.pull($scope.meals, meal);
    });
  }
});
