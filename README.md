# Brush

A [Responsive](http://www.adamkaplan.me/grid/) brush for building responsive layouts and typography with [Stylus](http://learnboost.github.io/stylus/) and [Jade](http://jade-lang.com). Built in realtime with [Gulp](http://gulpjs.com) and Coffeescript.

## Setup

If you've never used npm before, install Node with [homebrew](http://brew.sh/):

    brew install node

Install [Coffeescript](http://gulpjs.com):

    npm install -g coffee-script

Install [gulp](http://gulpjs.com):

    npm install -g gulp

Update your local npm modules:

    npm install

Create a command-line alias for `gulp` (to identitify coffee tasks):

    alias gulp='gulp --require coffee-script/register'

Optionally, create a `.aws.json` credentials for S3. **Don't forget to put this in `.gitignore`**.

      {
        "key": "",
        "secret": "",
        "bucket": ""
      }

## Development Tasks (Realtime)

Refer `examples/poem`.

There are three tasks.

**build**

    gulp --config=examples/poem/config.json

This compiles, minifies, and uglifies (javascript only) _stylus_, _jade_ templates, and _coffee_ files into an optimized HTML5, CSS3m, and Javascript.

**develop (default)**

    gulp --config=examples/poem/config.json

In addition to build, this runs a [connect](https://github.com/intesso/connect-livereload) server with Live Reload at **http://localhost:8080**. What's more, you can enjoy [Live coding](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) with Chrome. It pairs nicely as a split screen with Sublime or Vim.

**publish**

    gulp publish --config=examples/config.json

Publishes your page along with optimized assets (`/examples/app`) to S3.

## Status & Roadmap

Development, 0.1.3, _Unstable_.

TODO:

- integration with [nib](http://visionmedia.github.io/nib/)
- create mixin library for typography and layouts
- add reusable jade layouts

## Credits

Thanks to Adam Kaplan, the initial responsive grid css was ported from his excellent guide at [grid.css](http://www.adamkaplan.me/grid/).

## License

MIT License. See [LICENSE](/LICENSE) for more details.
