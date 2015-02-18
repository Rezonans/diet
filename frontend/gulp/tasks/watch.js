'use strict';

var config        = require('../config');
var gulp          = require('gulp');

gulp.task('watch', ['browserSync', 'server'], function() {

  gulp.watch(config.scripts.src, ['js', 'reload']);
  gulp.watch('src/**/*.+(css|less)',  ['css']);
  gulp.watch(config.images.src,  ['images', 'reload']);
  gulp.watch(config.views.src,   ['views']);

});
