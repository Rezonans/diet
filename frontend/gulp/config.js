'use strict';

module.exports = {

  'serverport': 3001,
  'browserPort': 3002,

  'fonts': {
    'src': [
      'src/**/fonts/*.*'
    ],
    'dest': 'build/fonts'
  },

  'images': {
    'src' : [
      'src/**/img/*.*'
    ],
    'dest': 'build/img'
  },

  'locales': {
    'src' : [
      'locales/**/*.*'
    ],
    'dest': 'build/locales'
  },

  'styles': {
    'src' : [
      'src/**/app.less'
    ],
    'dest': 'build/css'
  },

  'scripts': {
    'src' : [
      'tmp/**/*.js',
      'src/**/module.js',
      'src/**/*.js'
    ],
    'dest': 'build/js'
  },

  'views': {
    'src': [
      'src/**/*.jade'
    ],
    'dest': 'tmp/js'
  },

  'dist': {
    'root'  : 'build'
  }

};
