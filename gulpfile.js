var gulp = require("gulp"),
    gutil = require('gulp-util'),
    path = require('path'),
    changed = require('gulp-changed'),
    concat = require('gulp-concat'),
    minifyCSS = require('gulp-minify-css'),
    uglify = require('gulp-uglify'),
    stylus = require('gulp-stylus'),
    jade = require('gulp-jade'),
    open = require("gulp-open"),
    connect = require('gulp-connect');


var config = {
    root: path.resolve('./'),
    styles: './css/**/*.styl',
    styles_lib: './css/lib/**/*.css',
    templates: './*.jade',
    scripts: './js/**/*.js',
    app: 'app',
    app_index: './app/index.html',
    app_script: 'brush.min.js',
    app_style: 'brush.min.css',
    app_vendor_styles: 'brush.vendors.min.css',
    port: 8080
};

gulp.task('clean', function() {
    var files = [
        config.app + '/*.js',
        config.app + '/*.css',
        config.app + '/*.html',
    ];

    return gulp.src(files, {
        read: false
    })
        .pipe(clean({
            force: true
        }));
});

gulp.task('build-templates', function() {
    var data = {};

    gulp.src(config.templates)
        .pipe(jade({
            data: [data]
        }))
        .pipe(gulp.dest(config.app))
        .pipe(connect.reload());
});

gulp.task('build-styles', function() {
    gulp.src(config.styles)
        .pipe(stylus({
            errors: true
        }))
        .pipe(minifyCSS({
            keepBreaks: true
        }))
        .pipe(concat(config.app_style))
        .pipe(gulp.dest(config.app))
        .pipe(connect.reload());
});

gulp.task('build-styles-lib', function() {
    gulp.src(config.styles_lib)
        .pipe(stylus({
            errors: true
        }))
        .pipe(minifyCSS({
            keepBreaks: true
        }))
        .pipe(concat(config.app_vendor_styles))
        .pipe(gulp.dest(config.app));
});

gulp.task('build-scripts', function() {
    return gulp.src(config.scripts)
        .pipe(changed(config.app))
        .pipe(uglify())
        .pipe(concat(config.app_script))
        .pipe(gulp.dest(config.app))
        .pipe(connect.reload());
});

gulp.task('start-server', function() {
    connect.server({
        root: config.app,
        port: config.port,
        livereload: true
    });
});

gulp.task("open", function() {
    var options = {
        url: "http://localhost:" + config.port,
        app: "google chrome"
    };
    gulp.src(config.app_index)
        .pipe(open("", options));
});

gulp.task('watch', function() {
    gulp.watch(config.templates, ['build-templates']);
    gulp.watch(config.styles, ['build-styles']);
    gulp.watch(config.scripts, ['build-scripts']);
});

gulp.task('build', ['build-templates', 'build-styles', 'build-styles-lib', 'build-scripts']);

gulp.task('default', ['build', 'start-server', 'open', 'watch']);
