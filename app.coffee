axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
accord       = require 'accord'
postcss      = accord.load 'postcss'
lost         = require 'lost'
nestedprops  = require('postcss-nested-props').default
webpack      = require 'roots-webpack'
coffeeloader = require 'coffee-loader'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf', '.idea/**']

  extensions: [
    webpack(
      entry: './assets/js/index.tsx'
      output:
        filename: 'js/bundle.js'
#      resolve:
#        extensions: ["", ".webpack.js", ".web.js", ".ts", ".tsx", ".js"]
      module:
        loaders: [
          { test: /\.coffee$/, loader: "coffee-loader"},
          { test: /\.tsx?$/, loader: 'ts-loader'}
        ]
      ),
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    import: ['rupture']
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  postcss:
    use: [lost()]
