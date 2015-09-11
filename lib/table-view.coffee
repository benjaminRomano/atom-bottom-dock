{View, $} = require 'space-pen'
SlickGrid = require 'bd-slickgrid/grid'
{Emitter} = require 'atom'

class TableView extends View
  @content: ->
    @div style: 'width:100%;height:100%;', ->

  initialize: (@data, @columns) ->
    @emitter = new Emitter()

    resizeTimeout = null
    $(window).resize =>
      clearTimeout(resizeTimeout)
      resizeTimeout = setTimeout(@resize, 100)

  resize: (heightOnly) =>
    @grid.resizeCanvas()
    @grid.autosizeColumns() unless heightOnly

  addRows: (newData) ->
    return unless @grid
    @data = @data.concat newData
    @grid.setData @data
    @grid.invalidateAllRows()
    @grid.render()

  deleteAllRows: ->
    return unless @grid
    @data = []
    @grid.setData @data
    @grid.invalidateAllRows()
    @grid.render()

  attached: ->
    @data = @data ? []
    @columns = @columns ? []

    options =
      enableCellNavigation: true
      enableColumnReorder: true
      multiColumnSort: true
      forceFitColumns: true

    @grid = new SlickGrid @, @data, @columns, options
    @resize()

    @grid.onSort.subscribe (e, args) =>
      cols = args.sortCols
      @data.sort (dataRow1, dataRow2) ->
        for i in [0..cols.length-1]
          field = cols[i].sortCol.field
          sign = if cols[i].sortAsc then 1 else -1
          value1 = dataRow1[field]
          value2 = dataRow2[field]
          result = (if value1 == value2 then 0 else if value1 > value2 then 1 else -1) * sign
          if result != 0
            return result
        0
      @grid.invalidate()
      @grid.render()

    @grid.onClick.subscribe (e, args) =>
      @emitter.emit 'grid:clicked', @data[args.row]

    @emitter.emit 'table:attach:finished'

  onDidFinishAttaching: (callback) =>
    @emitter.on 'table:attach:finished', callback

  onDidClickGridItem: (callback) =>
    @emitter.on 'grid:clicked', callback

module.exports = TableView
