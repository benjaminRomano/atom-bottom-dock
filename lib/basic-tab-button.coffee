{Emitter} = require('atom')
{View} = require('space-pen')
TabButton = require('./tab-button')

class BasicTabButton extends TabButton
  @content: (config) ->
    @button click: 'clicked', class: 'btn', config.name

  clicked: =>
    @emitter.emit('tab:button:clicked', @getId())

module.exports = BasicTabButton
