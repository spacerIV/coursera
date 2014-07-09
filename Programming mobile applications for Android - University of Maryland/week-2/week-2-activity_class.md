Week 2 Activity Class
=====================

### Task Backstack 

- when an activity is started, it is pushed to the top of the backstack
- when an activity is destroyed, it is popped off the backstack

### Activity Lifecycle

- can be created, suspended, resumed, destroyed
- Activity States
    - resumed or running: - user is interacting
    - paused: visible - user not interacting, can be terminated (before 3.0 only)
    - stopped: not visible, can be terminated

![Lifecycle](https://raw.github.com/vichou/coursera/master/Programming%20mobile%20applications%20for%20Android%20-%20University%20of%20Maryland/pics/lifecycle-activity-android.png)

- onCreate()
    - super.onCreate (saveInstanceState)
    - setContentView(R.layout.*)
    - retain reference to ui views
    - configure views

-  onRestart()
    - when activity has stopped and is restarted
    - special processing needed after being stopped 

-  onStart()
    - when activity is about to become visible
    - loading persistant app state
    - start when-visible only behaviours

-  onResume()
    - when activity is visible and about to start interacting with user 
    - start foreground-only app behaviours

-  onPause()
    - shutdown foreground-only behaviours
    - about to switch to another activity
    - save persistant state ( rather than in onStop() since onStop may not be called if activity is killed )

-  onStop()
    - activity is no longer visible to user
    - may be restarted
    - cache state here
    - Note: may not be called if android kills your app

-  onDestroy()
    - release resources
    - save persistant state ( rather than in onStop() since onStop may not be called if activity is killed )

###  Starting Activities

- pass newly created Intent() to methods 
    - startactivity() - just starts new activity
    - startActivityForResult() 
        - provides result back to starting activity ( the onActivityResult() method in calling activity )
        - called activity needs to call Activity.setResult(int resultCode) or 
                                        Activity.setResult(int resultCode, Intent data) 
        - built in codes eg RESULT_OK, RESULT_CANCELLED, RESULT_FIRST_USER ( can add user codes )


### Configuration Changes

- device configuation can change at runtime ( orientation, keyboard, locale etc ) 
- android usually kills activity & restarts it
- this should be fast, try ..
    - cache an object containing important state information ( hard to recomupte data )
        - override the onRetainNonConfigurationInstance() method, to build and return configuration object - it will be called between onStop() and onDestroy()
        - to obtain this object, in onCreate(), call getLastNonConfigurationInstance() 
        - both of these have been deprecated in favour of fragment methods
    - you can manually handle the configutation change
        - ie prevent system from restarting activity
        - declare these in AndroidManifest.xml eg:

    
     <activity android:name=".MyActivity"
         android.configChanges="orientation|screensize|keyboardHidden"...>

        - when these are inplace and activity state changes, then the onConfigurationChnaged() method is called
        - its passed a configuation object specifying new device configuration
