'use strict';

/**
 * Service for the current user
 */
angular.module('app')
  .factory('CurrentUser', function CurrentUserService($auth, Restangular) {
    var promise;

    function load() {
      return (promise = Restangular.one('users', $auth.getPayload().user.id).get());
    }

    return {
      get: function() {
        return promise || load();
      },
      reload: function() {
        return load();
      },
      reset: function() {
        promise = undefined;
      }
    };
  });
