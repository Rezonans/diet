'use strict';

var config          = require('../config');
var gulp            = require('gulp');
var concat          = require('gulp-concat');
var sourcemaps      = require('gulp-sourcemaps');
var ngAnnotate      = require('gulp-ng-annotate');
var gulpif          = require('gulp-if');
var uglify          = require('gulp-uglify');
var mainBowerFiles  = require('main-bower-files');
var path            = require('path');
var browserSync     = require('browser-sync');
//var angularFilesort = require('gulp-angular-filesort');

gulp.task('js', function() {
  return gulp.src(mainBowerFiles({filter: '**/*.js'}).concat(config.scripts.src))
    .pipe(sourcemaps.init())
    .pipe(gulpif(function (file) {
      return global.isProd && new RegExp("^src\/").test(path.relative(file.cwd, file.path));
    }, ngAnnotate()))
    .pipe(concat('app.js'))
    .pipe(gulpif(global.isProd, uglify()))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(config.scripts.dest))
    .pipe(gulpif(browserSync.active, browserSync.reload({ stream: true })));
});
