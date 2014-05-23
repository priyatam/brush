## Brush

A [Responsive](http://www.adamkaplan.me/grid/) brush for [Stylus](http://learnboost.github.io/stylus/). Made with [Jade](http://jade-lang.com) and [Gulp](http://gulpjs.com)&mdash;in Coffeescript.

## Usage

If you've never used npm before, install Node with [homebrew](http://brew.sh/):

    brew install node

Install [gulp](http://gulpjs.com), globally:

    npm install -g gulp

Update your local npm modules:

    npm install

Run the default task:

    gulp --require coffee-script/register

This compiles, minifies, uglifies _stylus_, _coffee_, _jade_ templates into optimized HTML5/CSS3/Javascript and runs a [connect](https://github.com/intesso/connect-livereload) static server with LiveReload at **http://localhost:8080**.

Enjoy [live coding]([LiveReload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) with Chrome.

Sync /app with S3.

## Status

Experimental.

## Copyright & License

MIT License. See [LICENSE](/LICENSE) for more details.
