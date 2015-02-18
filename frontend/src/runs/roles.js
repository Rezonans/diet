'use strict';

/**
 * Config for the roles
 */
angular.module('app')
  .run(function Roles(Permission, $auth) {
    Permission.defineRole('anonymous', function() {
      return !$auth.isAuthenticated();
    });
  });
