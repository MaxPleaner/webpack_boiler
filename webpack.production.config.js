module.exports = {

  entry: "./entry.js",

  // the bundle is stored in memory, though it's referenced by this path
  output: { filename: "bundle.js" },

  module: {

    loaders: [

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
