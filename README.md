atom-bottom-dock
==================

[atom-bottom-dock](https://www.npmjs.com/package/atom-bottom-dock) is an npm helper module that you can use to create panes for the [bottom-dock](https://atom.io/packages/bottom-dock) atom package

##### API

```js
class DockPaneView extends View {
  setActive(active: boolean): void
  isActive(): boolean
  getId(): string
  destroy(): void
}
```

```js
class FilterSelector extends View {
  constructor(config?): void // where config is { filterLabel?: string, activeFilter?: string, filters?: [{ value: string, label?: string }]}
  updateFilters(config): void // where config is the same as constructor param
  setFilter(filterName: string): void
  getFilter(): string
  onDidChangeFilter(callback: Function): Disposable
  destroy(): void
}
```

```js
class TableView extends View {
  constructor(data, columns): void // See [here](https://github.com/mleibman/SlickGrid) for information on how to structure data and columns
  deleteAllRows(): void
  addRows(rows): void
  onDidFinishAttaching(callback: Function): Disposable
  onDidClickGridItem(callback: Function): Disposable
  resize(heightOnly: boolean): void
```

```js
class Toolbar extends View {
  addLeftTile(options): JQueryElement // where options is { item: JQueryElement, priority: int }
  addRightTile(options): JQueryElement // where options is { item: JQueryElement priority: int }
  destroy(): void
}
```

#### How to use
Extend the DockPaneView to create a new pane type for the bottom-dock package.

FilterSelector Example
```coffee
{FilterSelector} = require 'atom-bottom-dock'

config =
  activeFilter: 'filter1'
  label: 'Example Filter:'
  filters: [{
    value: 'filter1'
  }, {
    value: 'filter2'
    label: 'Filter2 Label'
  }]

filterSelector = new FilterSelector config

filterSelector.setActiveFilter 'filter2'
filterSelector.getActiveFilter() # 'filter2'
```

TableView Example
```coffee
{TableView} = require 'atom-bottom-dock'


columns = [
  {id: "type", name: "Type", field: "type", sortable: true }
  {id: "description", name: "Description", field: "description", sortable: true }
  {id: "path", name: "Path", field: "path", sortable: true }
  {id: "line", name: "Line", field: "line", sortable: true }
]

rows = [{
  type: "type"
  description: "description"
  path: "path"
  line: "line"
  message: "Some additional data to store with row (will not be displayed)"
}]

table = new TableView rows, columns

table.addRows rows

```

Toolbar Example
```coffee
{Toolbar} = require 'atom-bottom-dock'
toolbar = new Toolbar()

toolbar.addLeftTile item: $('button'), priority: 0
toolbar.addRightTile item: $('<span>Example</span>'), priority: 1
```
