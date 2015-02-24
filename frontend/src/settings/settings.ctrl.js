'use strict';

/* Controllers */

angular.module('app').controller('SettingsCtrl', function($scope, $auth, user) {
  $scope.settings = user.clone();

  $scope.update = update;

  function update() {
    $scope.settings.save().then(function(model) {
      _.assign(user, model.plain());

      alert('Saved!');
    });
  }
});
