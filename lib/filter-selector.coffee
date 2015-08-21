{Emitter} = require 'atom'
{View, $} = require 'space-pen'

class FilterSelector extends View
  @content: (config) ->
    @div class: 'filter-selector', =>
      @span outlet: 'filterLabel', class: 'filter-label', config.label if config?.label
      @div outlet: 'filterContainer', class: 'btn-group', =>
        if config?.filters
          for filter in config.filters
            @button class: 'filter-button', click: 'onFilterChanged', 'data-value': filter.value, filter.label ? filter.value

  initialize: (config) ->
    @emitter = new Emitter()

    @activeFilter = ""
    @setActiveFilter config.activeFilter if config?.activeFilter

  updateFilters: (config) ->
    @filterContainer.empty()

    if config.label
      if not @filterLabel
        @filterLabel = $("<span class='filter-label'>#{config.label}</span>")
        @filterLabel.insertBefore @filterContainer
      else
        @filterLabel.text config.label

    for filter in config.filters
      filterElement = $("<button class='filter-button' data-value='#{filter.value}'>#{filter.label}</button>")
      filterElement.on 'click', @onFilterChanged
      @filterContainer.append filterElement

    @setActiveFilter config.activeFilter

  onDidChangeFilter: (callback) ->
    return @emitter.on 'filter:changed', callback

  onFilterChanged: (e) =>
    @setActiveFilter e.target.dataset.value
    @emitter.emit 'filter:changed', @activeFilter

  setActiveFilter: (filterValue) ->
    @activeFilter = filterValue

    for child in @filterContainer.children()
      child = $(child)
      if child.data('value') is @activeFilter
        child.addClass('selected')
      else
        child.removeClass('selected')

  getActiveFilter: ->
    return @activeFilter

  destroy: ->
    @remove()

module.exports = FilterSelector
