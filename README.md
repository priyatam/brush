# Brush

Build responsive pages with [Stylus](http://learnboost.github.io/stylus/) and [Nib](http://visionmedia.github.io/nib/). 

In realtime with [Coffee](http://coffeescript.org) & [Gulp](http://gulpjs.com).  

## Setup
    
If you've never used npm before, install Node with [homebrew](http://brew.sh/):

    brew install node

Install [gulp](http://gulpjs.com) and [Coffeescript](http://gulpjs.com):

    npm install -g gulp
    npm install coffee-script
    
An alias sounds good (to identitify tasks in coffee):
    
    alias gulp='gulp --require coffee-script/register'

Update your local modules:

    npm install

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

Compile, minify, and uglify _stylus_, _jade_, and _coffeescript_.

    gulp --config=examples/poem/config.json

**develop (default)**

Build and run a [connect](https://github.com/intesso/connect-livereload) server with [Live Reload](http://livereload.com), and preview [live](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) with Chrome.

    gulp --config=examples/poem/config.json

Pairs nicely on a split screen with [Sublime](https://github.com/billymoon/Stylus).

**publish**

Publish an optimized page to [S3](http://aws.amazon.com/s3/).

    gulp publish --config=examples/poem/config.json

## Status & Roadmap

Development, 0.2.0, _Unstable_.

TODO:

- typography mixins
- layout for jade
- layout for bootstrap

## Credits

A big thanks to Adam Kaplan: I ported the initial responsive grid from his excellent [guide on RWD](http://www.adamkaplan.me/grid/).

## License

MIT, See [LICENSE](/LICENSE) for more details.
