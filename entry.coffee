
window.$ = require 'jquery'

React = require 'react'
ReactDOM = require 'react-dom'

class Root extends React.Component
  render: -> (
    <b>hello world </b>
  )

window.InitReact = ->
  ReactDOM.render <Root/>, document.getElementById("root-wrapper")

$ ->
  InitReact()