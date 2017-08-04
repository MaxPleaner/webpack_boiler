
window.$ = require 'jquery'

React = require 'react'
ReactDOM = require 'react-dom'
ReactNative = require 'react-native'
{ AppRegistry, Button, Text, View } = ReactNative


CounterButton = ({text, on_press}) ->
  <Button title='counter' onPress={on_press}>{text}</Button>

CounterValue = ({value}) ->
  <Text>{value}</Text>

class Counter extends React.Component
  constructor: (props) ->
    super(props)
    @state = counter_val: 1
  increment_counter: =>
    @setState (old_state) ->
      counter_val: old_state.counter_val + 1
  render: ->
    <View>
      <CounterButton
        on_press={@increment_counter}
        text='increment counter'
      />
      <CounterValue value={@state.counter_val} />
    </View>

window.InitReact = ->
  AppRegistry.registerComponent 'MyApp', () -> Counter
  AppRegistry.runApplication 'MyApp',
    rootTag: document.getElementById('root-wrapper')

$ ->
  InitReact() 