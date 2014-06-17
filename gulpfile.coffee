gulp        = require 'gulp'
stylus      = require 'gulp-stylus'
nib         = require 'nib'
jade        = require 'gulp-jade'
coffee      = require 'gulp-coffee'
connect     = require 'gulp-connect'
minifyCSS   = require 'gulp-minify-css'
uglify      = require 'gulp-uglify'
gutil       = require 'gulp-util'
path        = require 'path'
changed     = require 'gulp-changed'
concat      = require 'gulp-concat'
open        = require 'gulp-open'
aws         = require 'gulp-awspublish'
fs          = require 'fs'

config =
  root: path.resolve('./')
  styles: './css/**/*.styl'
  templates: './*.jade'
  scripts: ['./js/**/*.js', './js/**/*.coffee']
  app: 'app'
  app_index: './app/index.html'
  app_script: 'brush.min.js'
  app_style: 'brush.min.css'
  port: 8080

credentials = JSON.parse(fs.readFileSync('.aws.json', 'utf8'));

gulp.task 'clean', ->
  files = [ config.app + '/*.js',
            config.app + '/*.css',
            config.app + '/*.html']

  gulp.src files ->
    read: false
    .pipe clean force: true

gulp.task 'build-templates', ->
  data = {}
  gulp.src config.templates
    .pipe jade(data: data)
    .pipe gulp.dest config.app
    .pipe connect.reload()

gulp.task 'build-styles', ->
  gulp.src config.styles
    .pipe stylus (use: [nib()], errors: true)
    .pipe minifyCSS keepBreaks: true
    .pipe concat config.app_style
    .pipe gulp.dest config.app
      .pipe connect.reload()

gulp.task 'build-scripts', ->
  gulp.src config.scripts
    .pipe changed config.app
    .pipe uglify()
    .pipe concat config.app_script
    .pipe gulp.dest config.app
    .pipe connect.reload()

gulp.task 'start-server', ->
  connect.server
    root: config.app
    port: config.port
    livereload: true

gulp.task 'open', ->
  options =
    url: "http://localhost:" + config.port
    app: "google chrome"

  gulp.src config.app_index
    .pipe open("", options)

gulp.task 'watch', ->
    gulp.watch(config.templates, ['build-templates'])
    gulp.watch(config.styles, ['build-styles'])
    gulp.watch(config.scripts, ['build-scripts'])

gulp.task 'publish', ->
  publisher = aws.create(credentials)
  headers =
    'Cache-Control': 'max-age=315360000, no-transform, public'

  gulp.src('./app/*.*')
    .pipe publisher.publish(headers)
    .pipe publisher.cache()
    .pipe aws.reporter()

gulp.task('build', ['build-templates', 'build-styles', 'build-scripts'])
gulp.task('default', ['build', 'start-server', 'open', 'watch'])
