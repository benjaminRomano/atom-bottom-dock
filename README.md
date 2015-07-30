atom-bottom-dock
==================

[atom-bottom-dock](https://www.npmjs.com/package/atom-bottom-dock) is an npm helper module that you can use to create panes for the bottom-dock atom package
#### API

```js
class DockPaneView extends View {
  initialize(): void
  setActive(active: boolean): void
  isActive(): boolean
  getId(): string
  refresh(): void
  destroy(): void
  generateId(): string  //Internal use only
}
````

##### How to use
Extend the DockPaneView to create a new pane type for the bottom-dock package.
Functions on the DockPaneView class can be overriden if need be.
