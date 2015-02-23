'use strict';

/* Controllers */

angular.module('app').controller('SettingsCtrl', function($scope, $auth, Restangular) {
  $scope.settings = {};
  $scope.update = update;

  loadSettings();

  function loadSettings() {
    Restangular.one('users', $auth.getPayload().user.id).get().then(function(user) {
      $scope.settings = user;
    });
  }

  function update() {
    $scope.settings.save().then(function () {
      alert('Saved!');
    });
  }
});
