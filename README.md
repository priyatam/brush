# Brush

A [Responsive](http://www.adamkaplan.me/grid/) brush for building typographic pages with [Stylus](http://learnboost.github.io/stylus/) and [Jade](http://jade-lang.com). Built in realtime (with live coding and preview) with [Gulp](http://gulpjs.com)&mdash;in Coffeescript.

Pre-configured with JQuery, LetteringJs, [KerningJs](http://kerningjs.com/), [Fittext](http://fittextjs.com/), and [Modernizr](http://modernizr.com/).

## Setup

If you've never used npm before, install Node with [homebrew](http://brew.sh/):

    brew install node

Install [Coffeescript](http://gulpjs.com):

    npm install -g coffee-script

Install [gulp](http://gulpjs.com):

    npm install -g gulp

Update your local npm modules:

    npm install

Create a command-line alias for `gulp` (gulp doesn't identitify coffeescript builds):

    alias gulp='gulp --require coffee-script/register'

Finally, if you have an Amazon S3 account, create a `.aws.json` key file in the current folder (see `gulp publish`). *Don't forget* to ignore this file in git, by adding it to `.gitignore`.

  {
    "key": "",
    "secret": "",
    "bucket": ""
  }

## Development

There are only two tasks: `gulp` and `gulp publish`.

First, create a sample `.styl`, `.js`, and `.jade` files in a folder (See 'examples/poem').

Run the default task from the current directory and pass the project config:

    gulp --config=examples/poem/config.json

This task compiles _stylus_, _coffee_, and _jade_ templates into an optimized and minified HTML5/CSS3. It also minifies, uglifies Javascript and runs a [connect](https://github.com/intesso/connect-livereload) static server with Live Reload at **http://localhost:8080**. What's more, you can enjoy [Live coding](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) with Chrome with a split screen.

Publish a copy for client preview by uploading the assets under `/examples/app` to S3:

    gulp publish --config=examples/config.json

## Status & Roadmap

Development, 0.1.2, Unstable.

TODO: Deeper integration with [nib](http://visionmedia.github.io/nib/). A rich mixin library for magazine-style, responsive layouts.

## Credits

The initial responsive grid css is ported from the excellent [grid.css](http://www.adamkaplan.me/grid/) by Adam Kaplan. If you'rew new to responsive design, I recommmend reading his guide.

## License

MIT License. See [LICENSE](/LICENSE) for more details.
