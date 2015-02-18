'use strict';

var config     = require('../config');
var changed    = require('gulp-changed');
var gulp       = require('gulp');

gulp.task('locales', function() {
  return gulp.src(config.locales.src)
    .pipe(gulp.dest(config.locales.dest));
});
