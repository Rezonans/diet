'use strict';

/* Controllers */

angular.module('app').controller('MealsIndexCtrl', function($scope, $modal, Restangular) {
  $scope.meals = [];

  loadMeals();

  $scope.addMeal = addMeal;
  $scope.editMeal = editMeal;
  $scope.deleteMeal = deleteMeal;

  function loadMeals() {
    Restangular.all('meals').getList().then(function(meals) {
      $scope.meals = meals;
    });
  }

  function addMeal() {
    $modal.open({
      templateUrl: 'meals/create.html',
      controller: 'MealCreateCtrl'
    }).result.then(function() {
        loadMeals();
    });
  }

  function editMeal(meal) {
    $modal.open({
      templateUrl: 'meals/create.html',
      controller: 'MealEditCtrl',
      resolve: {
        meal: function() { return meal; }
      }
    }).result.then(function() {
        loadMeals();
    });
  }

  function deleteMeal(meal) {
    meal.remove().then(function() {
      _.pull($scope.meals, meal);
    });
  }
});
