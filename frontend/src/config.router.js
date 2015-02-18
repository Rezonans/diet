'use strict';

/**
 * Config for the router
 */
angular.module('app')
  .config(function ($stateProvider, $urlRouterProvider, $locationProvider) {
    $locationProvider.html5Mode(true);

    $stateProvider
      .state('app', {
        abstract: true,
        controller: 'AppCtrl',
        templateUrl: 'app/app.html'
      })
      .state('app.dashboard', {
        url: '/',
        controller: 'MealsCtrl',
        templateUrl: 'meals/meals.html'
      });

    $urlRouterProvider.otherwise('/');

  });