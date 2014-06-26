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
args        = require('yargs').argv;


config_file = if args.config? then args.config else path.resolve('./config.json')
config = JSON.parse(fs.readFileSync(config_file, 'utf8'));
console.log 'READ CONFIG VALUES: '
for key, value of config
  console.log "#{key} - #{value}"

gulp.task 'clean', ->
  files = [ config.app + '/*.js',
            config.app + '/*.css',
            config.app + '/*.html']

  gulp.src files ->
    read: false
    .pipe clean force: true

gulp.task 'default', ->
  gulp.src config.content
    .pipe markdown()
    .pipe gulp.dest config.app
    .pipe connect.reload()

gulp.task 'build-templates', ->
  data = {}
  gulp.src config.templates
    .pipe jade(data: data)
    .pipe gulp.dest config.app
    .pipe connect.reload()

gulp.task 'build-styles', ->
  gulp.src config.styles
    .pipe stylus (use: [nib()], errors: true, cache: false)
    .pipe minifyCSS keepBreaks: true
    .pipe concat config.final_style_name
    .pipe gulp.dest config.app
    .pipe connect.reload()

gulp.task 'build-scripts', ->
  gulp.src config.scripts
    .pipe changed config.app
    .pipe uglify()
    .pipe concat config.final_script_name
    .pipe gulp.dest config.app
    .pipe connect.reload()

gulp.task 'refresh-brush', ->
 gulp.src (config.app + '/' + config.final_style_name)
    .pipe gulp.dest './dist'

gulp.task 'start-server', ->
  connect.server
    root: config.app
    port: config.port
    livereload: true

gulp.task 'open-chrome', ->
  options =
    url: "http://localhost:" + config.port
    app: "google chrome"

  gulp.src config.app + '/index.html'
    .pipe open("", options)

gulp.task 'watch', ->
    gulp.watch(config.templates, ['build-templates'])
    gulp.watch(config.styles, ['build-styles'])
    gulp.watch(config.scripts, ['build-scripts'])

gulp.task 'publish', ->
  credentials = JSON.parse(fs.readFileSync('.aws.json', 'utf8'));
  publisher = aws.create(credentials)

  headers =
    'Cache-Control': 'max-age=315360000, no-transform, public'

  gulp.src config.app + '*.*'
    .pipe publisher.publish(headers)
    .pipe publisher.cache()
    .pipe aws.reporter()

gulp.task('build', ['build-templates', 'build-styles', 'build-scripts'])
gulp.task('develop', ['build', 'start-server', 'open-chrome', 'watch'])
gulp.task('default', ['develop'])

