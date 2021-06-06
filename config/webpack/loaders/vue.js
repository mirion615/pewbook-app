module.exports = {
  test: /\.vue(\.erb)?$/,
  use: [{
    loader: 'vue-loader'
  }],
  
  configureWebpack: {
    performance: {
      maxAssetSize: 270000,
      maxEntrypointSize: 700000,
    }
  } 
}
