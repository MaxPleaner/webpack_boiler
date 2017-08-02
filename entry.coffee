
window.$ = require 'jquery'

React = require 'react'
ReactDOM = require 'react-dom'
ReactNative = require 'react-native-web'
{ AppRegistry, Image, StyleSheet, Text, View } = ReactNative

Root = ->
  <Text>hello world </Text>

window.InitReact = ->
  AppRegistry.registerComponent 'MyApp', () -> Root
  AppRegistry.runApplication 'MyApp',
    rootTag: document.getElementById('root-wrapper')

$ ->
  InitReact()