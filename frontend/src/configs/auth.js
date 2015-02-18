'use strict';

/**
 * Config for the auth
 */
angular.module('app')
  .config(function($authProvider) {
    $authProvider.loginUrl = '/api/login';
    $authProvider.signupUrl = '/api/registration';
    $authProvider.signupRedirect = '/congratulations';
    $authProvider.logoutRedirect = '/login';
    $authProvider.tokenName = 'auth_token';
    $authProvider.tokenPrefix = 'satellizer';
    $authProvider.loginOnSignup = true;
  });
