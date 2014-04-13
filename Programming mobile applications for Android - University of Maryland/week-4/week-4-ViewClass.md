User Interfaces Classes
========================

### Views and View Events

#### View Class

- rectangular space on screen
- drawing and events
- predefined views
    - buttons
    - togglebutton
    - checkbox
    - ratingbar
    - autocomplete textview - provides suggestions
- common view operations
    - set visiblity, checked state, orientation, background,  etc
    - set listeners
- view event 
    - user interaction - touch, keyboard, trackpad
    - system control - lifecycle changes
    - many listeners eg 
        - onClickListener.onClick()
        - onFocusChangeListener.onFocusChange()

- views are organised in a tree ( see view heirarchy in ddms ), 
- displaying has multiple steps ...
    1. measure - get dimensions of views
        - View.onMeasure() 
    1. layout - position each view
        - View.onLayout() 
    1. draw - draw view
        - View.onDraw() 
- override methods when creating your own view
    - onFocusChanged()
    - onKeyUp()
    - onKeyDown()

