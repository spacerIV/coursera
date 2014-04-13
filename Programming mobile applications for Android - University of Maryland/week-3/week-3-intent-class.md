Intent Class
============


### Intent Class

- data structure that represents
    - an operation to be performed
    - an event has occured ( later lesson broadcast receivers )

## Operations to be performed
- pick a contact, take a photo, dial a number, display a map
- constructed by one component, received by activity that can perform work
- fields
    - action ( string )
        - ACTION_DIAL - dial a number 
            Intent newIntent = new Intent( Intent.ACTION_DIAL );
            or
            Intent newIntent = newIntent();
            newIntent.setAction(Intent.ACTION_DIAL);
        - ACTION_SYNC - sync device with server
        - ACTION_EDIT - display data to edit
        - ACTION_MAIN - initial activity of app
    - data eg: URI 
            Intent newIntent = new Intent( Intent.ACTION_DIAL, URI.parse(wadda) );
            or
            Intent newIntent = newIntent();
            newIntent.setData('tel: +445555555')
    - category eg: additional info about components that can handle the intent
        - category_browsable - can be invoked by browser
        - category_launcher - can be initial activity of a task & listed in top level app launcher
    - type : mime type 
        - image/png, image/jpeg
        - text/html, text/plain
        - if you dont specifiy, android will try to infer one for you
        - newIntent.setType( String mimetype ); or
        - newIntent.setDataAndType(URI uri,  String type); 
    - component : identifies intents target activity
        - Intent newIntent = new Intent (Context packageContext, Class<?> cls ) or
        - newIntent.setComponent()
        - newIntent.setClass()
        - newIntent.setClassNAme()
    - extra : additional data associated
        - map ( key - value pairs )
        - Intent.EXTRA_EMAIL  - sets recipents for email
        - Intent newIntent = new Intent( Intent.ACTION_SEND );
          newIntent.putExtra( Intent.EXTRA_EMAIL, new String[]{ "vichou@gmail.com@", "you@whatever.com" });
    - flags - information about how intent should be handled
        - FLAG_ACTIVITY_NO_HISTORY - dont put this activity in history stack
        - FLAG_DEBUG_LOG_RESOLUTION - display extra logging info when processing intent

### Starting Activities 

- The target activity can be explicitly named, or android can determine implicitly.
- Explicit 
    - Intent myIntent = new Intent(context, class ); 
- Implicit (  Intent Resolution )
    - Intent describing a desired operation
    - IntentFilters which describe which operations an activity can handle ( in AndroidManifest.xml or programatically )
    - Intent Resolution Data 
        - Action
        - URI ( both mime type and uri )
        - category
    - to receive implicit intents, an activity must include the category DEFAULT ie: "android.intent.category.DEFAULT"
    - to break a tie, ask the user or use priority ( between -1000 and 1000, higher is best )

- adb shell dumpsys package



