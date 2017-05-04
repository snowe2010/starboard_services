axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
postStylus   = require 'poststylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
accord       = require 'accord'
lost         = require 'lost'
nestedprops  = require('postcss-nested-props').default
webpack      = require 'roots-webpack'
coffeeloader = require 'coffee-loader'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf', '.idea/**']

  extensions: [
#    webpack(
#      entry: './assets/js/index.coffee'
#      output:
#        filename: 'js/bundle.js'
#      resolve:
#        extensions: ["", ".webpack.js", ".web.js", ".ts", ".tsx", ".js"]
#      module:
#        loaders: [
#          { test: /\.coffee$/, loader: "coffee-loader"}
#          { test: /\.tsx?$/, loader: 'ts-loader'}
#        ]
#      ),
    js_pipeline(files: ["assets/js/*.js", "assets/js/*.coffee"], out: "js/bundle.js")
    css_pipeline(files: 'assets/css/**/*.styl')
  ]

  stylus:
    import: ['rupture']
    use: [axis(), rupture(), autoprefixer(), postStylus(['lost'])]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
