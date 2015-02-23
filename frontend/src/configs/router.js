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
        templateUrl: 'app/app.html',
        data: {
          permissions: {
            except: ['anonymous'],
            redirectTo: 'auth.login'
          }
        }
      })
      .state('app.dashboard', {
        url: '/',
        controller: 'MealsIndexCtrl',
        templateUrl: 'meals/index.html'
      })
      .state('app.settings', {
        url: '/settings',
        controller: 'SettingsCtrl',
        templateUrl: 'settings/settings.html'
      })
      .state('auth', {
        abstract: true,
        templateUrl: 'auth/main.html',
        data: {
          permissions: {
            only: ['anonymous'],
            redirectTo: 'auth.dashboard'
          }
        }
      })
      .state('auth.registration', {
        url: '/registration',
        templateUrl: 'auth/registration.html',
        controller: 'AuthRegistrationCtrl'
      })
      .state('auth.login', {
        url: '/login',
        templateUrl: 'auth/login.html',
        controller: 'AuthLoginCtrl'
      });

    $urlRouterProvider.otherwise('/');

  });
