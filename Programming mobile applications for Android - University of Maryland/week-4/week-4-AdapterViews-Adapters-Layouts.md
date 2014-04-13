User Interfaces Classes
========================

### ViewGroups

- invisible views that contain other views 
- base class for containers and layouts
- AdapterViews are viewgroups whose children are managed by an Adapter
- Adapter manages the data for the adapterview to display
- eg: 
    - listview
    - radiogroup
    - timepicker, datepicker
    - webview, mapview
    - gallery
    - spinner

### Adapters and AdapterViews

- ListView 
    - is an adapterview displays scrolling list of selectable items
    - items managed by listadapter ( which should be an arrayadapter )
- Spinner 
    - is an adapterview displays scrolling list of items, can select one item 
    - items managed by listadapter
    - items managed by spinneradapter ( which should be an arrayadapter )


[performance tips for listview](http://lucasr.org/2012/04/05/performance-tips-for-androids-listview/)

### Layouts 

- generic viewgroup defines structure for containing views
- LinearLayout - horizontal , vertical
- RelativeLayout - positions of the children can be described in relation to each other or to the parent.
- TableLayout - rows and columns etc
- GridView - places its children in a rectangular grid.

### ConvertView 
    - use this if not null, cache of previously inflated views for performance
 

