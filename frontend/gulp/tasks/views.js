'use strict';

var config         = require('../config');
var gulp           = require('gulp');
var templateCache  = require('gulp-angular-templatecache');
var jade           = require('gulp-jade');

// Views task
gulp.task('views', function() {
  // Process any view files from app/views
  return gulp.src(config.views.src)
    .pipe(jade())
    .pipe(templateCache({
      standalone: true
    }))
    .pipe(gulp.dest(config.views.dest));

});
