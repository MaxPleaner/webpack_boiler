module.exports = {

  entry: "./entry.coffee",

  // the bundle is stored in memory, though it's referenced by this path
  output: { filename: "bundle.js" },

  module: {

    loaders: [

      // load slim teplates to html strings (from javascript)
      // example: require("html-loader./test.slim")
      {test: /\.slim$/, loader: ['slim-lang-loader']},

      // Coffee script files are loaded like regular JS files:
      // Foo = require("./foo.coffee")
      // Coffeescript 2 can output JSX and ES6,
      // so the output is then fed through Babel to produce ES5.
      {
        test: /\.coffee$/,
        exclude: /(node_modules|bower_components)/,
        loaders: [ // these loaders are run in reverse order
          {
            loader: 'babel-loader',
            query: {
              plugins: ['transform-react-jsx'],
              presets: ['es2015', 'react']
            }
          },
          'coffee-loader'
        ]
      },

      // Sass files once required are automatically attached to the dom.
      // example: require("foo.sass")
      {test: /\.sass$/, loader: "style-loader!css-loader!sass-loader" },
      {exclude: ['./node_modules']},

      // Manipulate gifs (and transform them into webm)
      { test: /\.gif$/, loader: ['raw-loader', "animation-loader"] }

    ]
  },

  resolve: {

    extensions: [
      ".js", ".coffee", ".slim", ".sass", ".css", "jsx", ".gif"
    ],
    alias: {
      'react-native': 'react-native-web'
    },    

    // Something needed for Vue
    // alias: {
    //   'vue$': 'vue/dist/vue.esm.js'
    // }

  },

  // Starts a static server with index.html at root
  context: __dirname,

};
