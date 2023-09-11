# Getting Started with diet-planner-web

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

To execute: 
1. run npm install --legacy-peer-deps
2. go to node_modules/react-scripts/config/webpack.config.js
3. go in module.exports => return => resolve 
4. incolla questo 
```json
fallback: {
   path: require.resolve("path-browserify"),
   crypto: require.resolve("crypto-browserify"),
   os: require.resolve("os-browserify"),
   stream: require.resolve("stream-browserify"),
   fs: false,
   child_process: false
},
```
