{Emitter} = require('atom')
{View} = require('space-pen')

class TabButton extends View
  initialize: (config) ->
    @id = 'tab-button-' + config.id
    @setActive(config.active)

    @emitter = new Emitter()

  getId: ->
    return @id.split('tab-button-')[1]

  isActive: ->
    return @active

  setActive: (value) ->
    @active = value
    if @active
      @addClass('selected')
    else
      @removeClass('selected')

  onDidClick: (callback) ->
    return @emitter.on('tab:button:clicked', callback)

  destroy: ->
    @remove()

module.exports = TabButton
