'use strict';

/**
 * Config for the auth
 */
angular.module('app')
  .run(function($http, $auth) {
    $http.defaults.withCredentials = true;
    $http.defaults.transformRequest.push(function(data, headersGetter) {
      if ($auth.isAuthenticated()) {
        headersGetter()['X-User-Token'] = $auth.getToken();
      }
      return data;
    });
  });
