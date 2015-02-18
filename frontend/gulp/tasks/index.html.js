'use strict';

var config         = require('../config');
var gulp           = require('gulp');
var jade           = require('gulp-jade');
var inject         = require('gulp-inject');

// Views task
gulp.task('index.html', function() {
  var sources = gulp.src(['build/js/*.js', 'build/css/*.css'], {read: false});

  // Put our index.html in the dist folder
  gulp.src('index.jade')
    .pipe(inject(sources, {ignorePath: '/build'}))
    .pipe(jade({
      compilerOpts: {format: 'html5'}
    }))
    .pipe(gulp.dest(config.dist.root));
});
