'use strict';

var config         = require('../config');
var gulp           = require('gulp');
var less           = require('gulp-less');
var gulpif         = require('gulp-if');
var handleErrors   = require('../util/handleErrors');
var browserSync    = require('browser-sync');
var sourcemaps     = require('gulp-sourcemaps');
var minifyCSS      = require('gulp-minify-css');
var mainBowerFiles = require('main-bower-files');
var concat         = require('gulp-concat');

gulp.task('css', function () {
  return gulp.src(mainBowerFiles({filter: '**/*.css'}).concat(config.styles.src))
    .pipe(gulpif(!global.isProd, sourcemaps.init()))
    .pipe(gulpif('**/*.less', less()))
    .on('error', handleErrors)
    .pipe(concat('app.css'))
    .pipe(gulpif(!global.isProd, sourcemaps.write()))
    .pipe(gulpif(global.isProd, minifyCSS()))
    .pipe(gulp.dest(config.styles.dest))
    .pipe(gulpif(browserSync.active, browserSync.reload({ stream: true })))
});
