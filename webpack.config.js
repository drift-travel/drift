const webpack = require('webpack');
const path = require('path');

const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

let filename = 'application';

if (process.env.WEBPACK_ENV === 'production') {
  var UglifyJsPlugin = webpack.optimize.UglifyJsPlugin;

  plugins.push(new UglifyJsPlugin({ minimize: true }));
  plugins.push(new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"production"'
      }
    }
  ));

  filename = `${filename}.js`;
} else {
  filename = `${filename}.min.js`;
}

module.exports = {
  entry: [
    './apps/web/assets/jsc/application.js',
    './apps/web/assets/css/application.sass'
  ],
  output: {
    path: path.resolve(__dirname, './public/assets/jsc'),
    filename: 'application.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      },
      {
        test: /\.(sass|scss)$/,
        loader: ExtractTextPlugin.extract(['css-loader', 'sass-loader'])
      }
    ]
  },
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js',
      'css': path.resolve(__dirname, './apps/web/assets/css/lib/')
    }
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"' + process.env.NODE_ENV + '"'
      }
    }),
    new ExtractTextPlugin({
      filename: '../css/application.css',
      allChunks: true
    }),
    new CopyWebpackPlugin([
      {
        context: path.resolve(__dirname, './apps/web/assets/fonts/'),
        from: {
          glob:'**/*'
        },
        to: path.resolve(__dirname, './public/assets/fonts/')
      }
    ])
  ],
  devtool: "source-map",
  watchOptions: {
    poll: true
  }
};
