## Brush

A [Responsive]((http://www.adamkaplan.me/grid/) brush for [Stylus](http://learnboost.github.io/stylus/). 

## Usage

If you've never used npm before, install Node with [homebrew](http://brew.sh/):

    brew install node

Install [gulp](http://gulpjs.com), globally:

    npm install -g gulp

After completing the setup, update your local npm dependencies (repeat after adding a dependency to [package.json](/package.json)):

    npm install

Run the default task:

    gulp

This builds, minifies, uglifies [stylus, js, jade] and runs a static server at localhost:8080.

Chrome users can download [LiveReload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) and enjoy live coding and preview.

The final output sits nicely under /app so you can sync it to S3.

## Status

Pre-Alpha.

## Copyright & License

MIT License. See [LICENSE](/LICENSE) for more details.
