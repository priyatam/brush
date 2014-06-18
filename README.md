# Brush

A [Responsive](http://www.adamkaplan.me/grid/) brush for [Stylus](http://learnboost.github.io/stylus/) and [Jade](http://jade-lang.com), built in realtime with [Gulp](http://gulpjs.com)&mdash;in Coffeescript.

Pre-configured with JQuery, LetteringJs, [KerningJs](http://kerningjs.com/), [Fittext](http://fittextjs.com/), and [Modernizr](http://modernizr.com/).

## Setup

If you've never used npm before, install Node with [homebrew](http://brew.sh/):

    brew install node

Install [Coffeescript](http://gulpjs.com), globally:

    npm install -g coffee-script

Install [gulp](http://gulpjs.com), globally:

    npm install -g gulp

Update your local npm modules:

    npm install

Create an alias:

    alias gulp='gulp --require coffee-script/register'

If you have an Amazon S3 account, create a `.aws.json` key file in the root (see `gulp publish`). Ensure that you add this to `.gitignore`.

  {
    "key": "",
    "secret": "",
    "bucket": ""
  }

## Development

Brush is built with gulp. Run the defaut task from the root:

    gulp

## Examples

Create your own stylus, js, and jade files in a folder ('examples').

Run the default task from the root of brush and pass the config:

    gulp --config=examples/config.json

This task does the following:

- compiles _stylus_, _coffee_, _jade_ templates into optimized HTML5/CSS3
- minifies, uglifies Javascript and CSS3
- runs a [connect](https://github.com/intesso/connect-livereload) static server with Live Reload at **http://localhost:8080**.

Enjoy [Live coding](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) with Chrome.

Sync `/app` with S3:

    gulp publish --config=examples/config.json

## Status

Development, 0.1.1

## Credits

The initial responsive grid css is ported from the excellent [grid.css](http://www.adamkaplan.me/grid/) by Adam Kaplan. If you'rew new to responsive design, I recommmend reading his guide.

## License

MIT License. See [LICENSE](/LICENSE) for more details.
