'use strict';

var config      = require('../config');
var browserSync = require('browser-sync');
var gulp        = require('gulp');

gulp.task('browserSync', function() {

  browserSync({
    proxy: 'diet.dev',
    port: config.browserPort
  });

});
