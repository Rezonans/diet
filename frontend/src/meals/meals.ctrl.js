'use strict';

/* Controllers */

angular.module('app').controller('MealsCtrl', function($scope) {
  $scope.meals = [{
    date: new Date(),
    text: 'text',
    callories: 10
  }, {
    date: new Date(),
    text: 'text',
    callories: 20
  }, {
    date: new Date(),
    text: 'text2',
    callories: 30
  }];
});
