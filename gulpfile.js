var gulp = require('gulp');
var concat = require('gulp-concat');
var coffee = require('gulp-coffee');

var paths = {
	scripts: ['./src/*.js', "./src/*.coffee"]
}
gulp.task('scripts', function() {
	return gulp.src(paths.scripts, { sourcemaps: true })
		.pipe(coffee({ bare: true }))
		.pipe(concat('all.js'))
		.pipe(gulp.dest('./dist/'));
});


// Rerun the task when a file changes
gulp.task('watch', function() {
	gulp.watch(paths.scripts, ['scripts']);
	// gulp.watch(paths.images, ['images']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['watch', 'scripts']); //, 'images'