#clean previous project stuff
echo '----------------------------';
echo 'clean previous project stuff'
echo '----------------------------';
rm -rf src node_modules dist
rm tsconfig.json tslint.json index.html .npmrc package.json webpack.common.js webpack.dev.js webpack.prod.js webpack.config.js devBuild.sh prodBuild.sh clean.sh serve.sh
echo 'done
'

#setup folder structure
echo '----------------------------';
echo 'setup folder structure'
echo '----------------------------';
mkdir src
mkdir src/components
mkdir src/img
echo 'done
'





#install modules
echo '----------------------------';
echo 'install modules'
echo '----------------------------';
echo package-lock=false>.npmrc
echo '{
  "name": "scaffolder",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {},
  "devDependencies": {
    "@types/react": "16.3.5",
    "@types/react-dom": "16.0.4",
    "react": "16.3.0",
    "react-dom": "16.3.0",
    "awesome-typescript-loader": "5.0.0-1",
    "css-loader": "0.28.11",
    "file-loader": "1.1.11",
    "html-webpack-plugin": "3.2.0",
    "mini-css-extract-plugin": "0.4.0",
    "optimize-css-assets-webpack-plugin": "4.0.0",
    "source-map-loader": "0.2.3",
    "style-loader": "0.20.3",
    "tslint": "5.9.1",
    "typescript": "2.8.1",
    "uglifyjs-webpack-plugin": "1.2.4",
    "webpack": "4.5.0",
    "webpack-cli": "2.0.14",
    "webpack-dev-server": "3.1.1",
    "webpack-merge": "4.1.2"
  }
}'>package.json
npm install
echo 'done
'

#generate typescript config file
echo '----------------------------';
echo 'emitting typescript configuration file';
echo '----------------------------';
echo '{
    "compilerOptions": {
        "target": "es5",
        "lib": [
            "es2015",
            "dom"
        ],
        "module": "commonjs",
        "jsx": "react",
        "declaration": false,
        "sourceMap": true,
        "outDir": "./dist",
        "removeComments": true,
        "noEmit": true,
        "strict": true,
        "noImplicitAny": true,
        "strictNullChecks": true,
        "experimentalDecorators": true,
        "emitDecoratorMetadata": true
    },
    "include": [
        "./src/**/*"
    ],
    "exclude": [
        "node_modules"
    ]
}'>tsconfig.json
echo 'done
'

#generate tslint config file
echo '----------------------------';
echo 'generate tslint config file';
echo '----------------------------';
echo '{
  "defaultSeverity": "error",
  "extends": [
    "tslint:recommended"
  ],
  "jsRules": {
    "object-literal-sort-keys": false,
    "trailing-comma": false,
    "quotemark": [
      true,
      "single"
    ]
  },
  "rules": {
    "quotemark": [
      true,
      "single"
    ],
    "no-var-requires": false,
    "no-console": [
      false,
      "info",
      "log",
      "error"
    ],
    "eofline": false,
    "ordered-imports": [
      false
    ],
    "object-literal-sort-keys": false,
    "object-literal-key-quotes": false,
    "variable-name": [
      true,
      "allow-leading-underscore"
    ],
    "trailing-comma": [
      false
    ],
    "max-line-length": [
      false
    ],
    "interface-name": false,
    "prefer-for-of": false
  },
  "rulesDirectory": []
}'>tslint.json
echo 'done
'


echo '----------------------------';
echo 'generate sample component src code file';
echo '----------------------------';
echo "import * as React from 'react';
const logo = require('../img/logo.svg');
import './App.css';

export interface AppProps { message: string; }

export class App extends React.Component<AppProps, {}> {
    public render() {
        return (
            <div className='app'>
                <div className='appHeader'>
                    <img src={logo} id='logo' />
                    <h1>{this.props.message}</h1>
                </div>

            </div>
        );
    }
}">src/components/App.tsx
echo 'done
';

echo "body {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
  
.app {
    text-align: center;
}

.appHeader {
    background-color: #222;
    height: 200px;
    padding: 20px;
    color: white;
}

#logo {
    animation: logoSpin infinite 2s ease;
    height: 120px;
}
  
@keyframes logoSpin {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}">src/components/App.css;


echo '----------------------------';
echo 'generate sample index file';
echo '----------------------------';
echo "import * as React from 'react';
import * as ReactDOM from 'react-dom';

import { App } from './components/App';

ReactDOM.render(
    <App message='Welcome to React, TypeScript and WebPack' />,
    document.getElementById('root')
);
">src/index.tsx
echo 'done
';

echo '----------------------------';
echo 'generate html template file';
echo '----------------------------';
echo '<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8 />
    <title>Scaffolder</title>
</head>
<body>
    <div id="root"></div>
</body>
</html>'>src/index.html
echo 'done
';

echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 841.9 595.3">
    <g fill="#61DAFB">
        <path d="M666.3 296.5c0-32.5-40.7-63.3-103.1-82.4 14.4-63.6 8-114.2-20.2-130.4-6.5-3.8-14.1-5.6-22.4-5.6v22.3c4.6 0 8.3.9 11.4 2.6 13.6 7.8 19.5 37.5 14.9 75.7-1.1 9.4-2.9 19.3-5.1 29.4-19.6-4.8-41-8.5-63.5-10.9-13.5-18.5-27.5-35.3-41.6-50 32.6-30.3 63.2-46.9 84-46.9V78c-27.5 0-63.5 19.6-99.9 53.6-36.4-33.8-72.4-53.2-99.9-53.2v22.3c20.7 0 51.4 16.5 84 46.6-14 14.7-28 31.4-41.3 49.9-22.6 2.4-44 6.1-63.6 11-2.3-10-4-19.7-5.2-29-4.7-38.2 1.1-67.9 14.6-75.8 3-1.8 6.9-2.6 11.5-2.6V78.5c-8.4 0-16 1.8-22.6 5.6-28.1 16.2-34.4 66.7-19.9 130.1-62.2 19.2-102.7 49.9-102.7 82.3 0 32.5 40.7 63.3 103.1 82.4-14.4 63.6-8 114.2 20.2 130.4 6.5 3.8 14.1 5.6 22.5 5.6 27.5 0 63.5-19.6 99.9-53.6 36.4 33.8 72.4 53.2 99.9 53.2 8.4 0 16-1.8 22.6-5.6 28.1-16.2 34.4-66.7 19.9-130.1 62-19.1 102.5-49.9 102.5-82.3zm-130.2-66.7c-3.7 12.9-8.3 26.2-13.5 39.5-4.1-8-8.4-16-13.1-24-4.6-8-9.5-15.8-14.4-23.4 14.2 2.1 27.9 4.7 41 7.9zm-45.8 106.5c-7.8 13.5-15.8 26.3-24.1 38.2-14.9 1.3-30 2-45.2 2-15.1 0-30.2-.7-45-1.9-8.3-11.9-16.4-24.6-24.2-38-7.6-13.1-14.5-26.4-20.8-39.8 6.2-13.4 13.2-26.8 20.7-39.9 7.8-13.5 15.8-26.3 24.1-38.2 14.9-1.3 30-2 45.2-2 15.1 0 30.2.7 45 1.9 8.3 11.9 16.4 24.6 24.2 38 7.6 13.1 14.5 26.4 20.8 39.8-6.3 13.4-13.2 26.8-20.7 39.9zm32.3-13c5.4 13.4 10 26.8 13.8 39.8-13.1 3.2-26.9 5.9-41.2 8 4.9-7.7 9.8-15.6 14.4-23.7 4.6-8 8.9-16.1 13-24.1zM421.2 430c-9.3-9.6-18.6-20.3-27.8-32 9 .4 18.2.7 27.5.7 9.4 0 18.7-.2 27.8-.7-9 11.7-18.3 22.4-27.5 32zm-74.4-58.9c-14.2-2.1-27.9-4.7-41-7.9 3.7-12.9 8.3-26.2 13.5-39.5 4.1 8 8.4 16 13.1 24 4.7 8 9.5 15.8 14.4 23.4zM420.7 163c9.3 9.6 18.6 20.3 27.8 32-9-.4-18.2-.7-27.5-.7-9.4 0-18.7.2-27.8.7 9-11.7 18.3-22.4 27.5-32zm-74 58.9c-4.9 7.7-9.8 15.6-14.4 23.7-4.6 8-8.9 16-13 24-5.4-13.4-10-26.8-13.8-39.8 13.1-3.1 26.9-5.8 41.2-7.9zm-90.5 125.2c-35.4-15.1-58.3-34.9-58.3-50.6 0-15.7 22.9-35.6 58.3-50.6 8.6-3.7 18-7 27.7-10.1 5.7 19.6 13.2 40 22.5 60.9-9.2 20.8-16.6 41.1-22.2 60.6-9.9-3.1-19.3-6.5-28-10.2zM310 490c-13.6-7.8-19.5-37.5-14.9-75.7 1.1-9.4 2.9-19.3 5.1-29.4 19.6 4.8 41 8.5 63.5 10.9 13.5 18.5 27.5 35.3 41.6 50-32.6 30.3-63.2 46.9-84 46.9-4.5-.1-8.3-1-11.3-2.7zm237.2-76.2c4.7 38.2-1.1 67.9-14.6 75.8-3 1.8-6.9 2.6-11.5 2.6-20.7 0-51.4-16.5-84-46.6 14-14.7 28-31.4 41.3-49.9 22.6-2.4 44-6.1 63.6-11 2.3 10.1 4.1 19.8 5.2 29.1zm38.5-66.7c-8.6 3.7-18 7-27.7 10.1-5.7-19.6-13.2-40-22.5-60.9 9.2-20.8 16.6-41.1 22.2-60.6 9.9 3.1 19.3 6.5 28.1 10.2 35.4 15.1 58.3 34.9 58.3 50.6-.1 15.7-23 35.6-58.4 50.6zM320.8 78.4z"/>
        <circle cx="420.9" cy="296.5" r="45.7"/>
        <path d="M520.5 78.1z"/>
    </g>
</svg>
'>src/img/logo.svg


echo '----------------------------';
echo 'generate webpack configuration files';
echo '----------------------------';
echo "const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const VENDOR_LIBS = [
    'react', 'react-dom'
];

module.exports = {
    context: path.resolve(__dirname, './src'),
    entry: {
        bundle: './index.tsx',
        vendor: VENDOR_LIBS
    },
    output: {
        chunkFilename: '[name].bundle.js',
        filename: '[name].[chunkhash].js'
    },
    resolve: { extensions: ['.ts', '.tsx', '.js', '.json'] },

    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
            chunkFilename: '[id].css'
        }),

        new HtmlWebpackPlugin({
            template: 'index.html'
        })
    ],

    module: {
        rules: [
            // All files with a '.ts' or '.tsx' extension will be handled by 'awesome-typescript-loader'.
            { test: /\.tsx?$/, loader: 'awesome-typescript-loader' },

            {
                test: /\.css$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    'css-loader'
                ]
            },

            {
                test: /\.(jpe?g|png|gif|svg)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {}
                    }
                ]
            }
        ]
    },

    optimization: {
        splitChunks: {
            cacheGroups: {
                default: false,
                commons: {
                    test: /[\/]node_modules[\/]/,
                    name: 'vendor',
                    chunks: 'all'
                }
            }
        }
    }
};
">webpack.common.js
echo "const merge = require('webpack-merge');
const common = require('./webpack.common.js');

const merged = merge(common, {
    devtool: 'source-map',
    mode: 'development',
    module: {
        rules: [
            // All output '.js' files will have any sourcemaps re-processed by 'source-map-loader'.
            { enforce: 'pre', test: /\.js$/, loader: 'source-map-loader' }
        ]
    },
    devServer: {
        open: true,
        contentBase: false,
        compress: true,
        port: 9000,
        openPage: ''
    }
});

module.exports = merged;
">webpack.dev.js
echo "const merge = require('webpack-merge');
const common = require('./webpack.common.js');

const webpack = require('webpack');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

const merged = merge(common, {
    mode: 'production',
    plugins: [
        new UglifyJSPlugin({
            uglifyOptions: {
                compress: true,
                minimize: true,
                warnings: false,
                output: {
                    comments: false,
                    beautify: false
                }
            }
        }),

        new OptimizeCSSAssetsPlugin({}),

        new webpack.DefinePlugin({
            'process.env.NODE_ENV': JSON.stringify('production')
        })
    ]
});

module.exports = merged;
">webpack.prod.js
echo 'done
';


echo 'echo cleaning dist folder
rm -rf dist'>clean.sh
chmod +x clean.sh

echo './clean.sh
echo ">>>>> Development Packing <<<<<<<<"
echo packing project files...
./node_modules/.bin/webpack --config webpack.dev.js
open dist'>devBuild.sh
chmod +x devBuild.sh

echo './clean.sh
echo ">>>>> Production Packing <<<<<<<<"
./node_modules/.bin/webpack --config webpack.prod.js
open dist'>prodBuild.sh
chmod +x prodBuild.sh

echo 'echo starting webpack dev server...
./node_modules/.bin/webpack-dev-server --progress --color --open "Google Chrome" --config webpack.dev.js
'>serve.sh
chmod +x serve.sh

echo '==================
Scaffolding is done.
==================
Simply run the commands:
./devBuild.sh        # to build in dev mode
./prodBuild.sh       # to build in production mode
./serve.sh          # to run webpack dev server in watch mode
./clean.sh          # to clean up previous builds
==================

enjoy!
';
