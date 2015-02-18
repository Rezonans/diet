'use strict';

var config     = require('../config');
var changed    = require('gulp-changed');
var gulp       = require('gulp');
var mainBowerFiles = require('main-bower-files');

// Fonts
gulp.task('fonts', function() {
  return gulp.src(mainBowerFiles({filter: '**/fonts/*.*'}).concat(config.fonts.src))
    .pipe(gulp.dest(config.fonts.dest));
});
