## Brush

A [Responsive](http://www.adamkaplan.me/grid/) brush for [Stylus](http://learnboost.github.io/stylus/). Made with  with [Jade](http://jade-lang.com), and built in realtime with [Gulp](http://gulpjs.com)&mdash;in Coffeescript.

### Setup

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

## Usage

Run the default task:

    gulp

This compiles, minifies, uglifies _stylus_, _coffee_, _jade_ templates into optimized HTML5/CSS3/Javascript
and runs a [connect](https://github.com/intesso/connect-livereload) static server with LiveReload at **http://localhost:8080**.

Enjoy [Live coding](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) with Chrome.

Sync /app with S3.

    gulp publish

## Status

Development, 0.1.1

## Credits

The initial css baseline is ported from the excellent [grid.css](http://www.adamkaplan.me/grid/) by Adam Kaplan.

## License

MIT License. See [LICENSE](/LICENSE) for more details.
