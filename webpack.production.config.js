module.exports = {

  entry: "./entry.js",

  // the bundle is stored in memory, though it's referenced by this path
  output: { filename: "dist/bundle.js" },

  module: {

    loaders: [
      {
        test: /\.html$/i,
        use: 'html-loader',
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      }
    ]
  },

  resolve: {

    extensions: [
      ".js", "html"
    ],

  },

  // Starts a static server with index.html at root
  context: __dirname,

};
