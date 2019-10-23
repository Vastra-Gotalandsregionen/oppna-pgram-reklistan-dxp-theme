'use strict';

var gulp = require('gulp');
var liferayThemeTasks = require('liferay-theme-tasks');

var uglify = require('gulp-uglify');
var concat = require('gulp-concat');

var jsFiles = [
	'./src/lib/respond/dest/respond.min.js',
	'./src/lib/es5-shim/es5-shim.min.js',
	'./src/custom-lib/jquery/jquery-1.11.2.min.js',
	'./src/lib/modernizr/modernizr.js',
	'./src/lib/handlebars/handlebars.min.js',
	'./src/lib/svg4everybody/svg4everybody.ie8.min.js',
	'./src/lib/fastclick/lib/fastclick.js',
	'./src/lib/routie/lib/routie.js',
    './src/lib/lunr.js-2.3.6/lunr.js',
	'./src/custom-lib/swag/swag.min.js',
	'./src/custom-lib/loStorage.js/loStorage.js'
];

gulp.task('buildjs', function() {
  return gulp.src(jsFiles)
    .pipe(uglify())
    .pipe(concat('libs.min.js'))
    .pipe(gulp.dest('./src/js'));
});

liferayThemeTasks.registerTasks({
	gulp: gulp
});
