'use strict';

/* Controllers */

angular.module('app').controller('StatisticsIndexCtrl', function($scope, Restangular, $filter, user) {
  $scope.filters = {};
  $scope.openedDates = {};
  $scope.showTimes = {};

  $scope.apply = loadStatistics;
  $scope.open = open;
  $scope.toggleTime = toggleTime;

  loadStatistics();

  function loadStatistics() {
    $scope.labels = [];
    $scope.data = [];
    $scope.series = [];

    Restangular.all('calories').getList(formatedParams()).then(function(calories) {
      $scope.labels = _.pluck(calories, 'date_only');
      $scope.data = [_.pluck(calories, 'calories_sum')];
      $scope.series = ['Eaten'];

      if (user.daily_calories_limit) {
        $scope.data.push(_.times(calories.length, function() { return user.daily_calories_limit; }));
        $scope.series.push('Limit');
      }
    });
  }

  function formatedParams() {
    var params = {};

    if ($scope.filters.dateFrom) {
      params['date_from'] = formatDate($scope.filters.dateFrom);
    }

    if ($scope.filters.dateTo) {
      params['date_to'] = formatDate($scope.filters.dateTo);
    }

    if ($scope.filters.timeFrom) {
      params['time_from'] = formatTime($scope.filters.timeFrom);
    }

    if ($scope.filters.timeTo) {
      params['time_to'] = formatTime($scope.filters.timeTo);
    }

    return params;
  }

  function formatTime(time) {
    return $filter('date')(time, 'HH:mm');
  }

  function formatDate(time) {
    return $filter('date')(time, 'yyyy-MM-dd');
  }

  function open(key, $event) {
    $event.preventDefault();
    $event.stopPropagation();

    $scope.openedDates[key] = true;
  }

  function toggleTime(key) {
    $scope.filters[key] = $scope.showTimes[key] ? new Date() : undefined;
  }
});
