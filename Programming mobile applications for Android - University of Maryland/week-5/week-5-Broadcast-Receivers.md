Broadcast Receivers 
========================

### Broadcast Class

- Base class for components that receive and react to events
- when events occur they are represented as intents
- those intents are broadcast to system
- android routes the intents to broadcastreceivers that have registers to receive them

### Registration 

1. register broadcastreceivers
    1. statically in androidmanifest xml
        - add <receiver> tag, with <intent-filter> tag
        - receivers are registered at boot or when package is added at runtime
    1. dynamically at run time
        - create an intentfilter 
        - create a broadcast receiver
        - register receiver using registerReceiver() using 
            1. LocalBroadcastManager - for local broadcasts, not systemwide broadcasts
            - context() class - sends broadcasts systemwide
        - unregisterReceiver() to unregisterBroadcastReceiver
1. generate intent and broadcast it to system
1. android deleiver intent to registered receivers by calling their onReceive() method
1. event handled in onReceive()

### Broadcast 

- several methods supported
    - Normal vs ordered - self explainatory
        - normal = sendBroadcast()
        - ordered = sendOrderedBroadcast()
    - sticky vs non-sticky 
        - sticky caches intent after broadcast, eg battery intent
        - call isInitialStickyBroadcast() to see if Intent is cached ( could be stale )
        - new intents overwrite older intents they match
        - when BC-Receivers are dynamically registered, cached sitcky Intents are BCed to BC receiver
        - Broadcaster must have BROADCAST_STICKY permission to sen sticky intents
        - non-sticky discards it
    - with or without permissions
    - can use sticky & ordered sendStickyOrderedBroadcast

### Delivery

- Intents delivered by calling onReceive() passing in :
    - Context and Intent that was broadcast
- events in onReceive()m the hosting process has high priority since it might need to be started up.
- onReceive() runs on main thread, use a service if long running
- receiver is valid only when onReceive() is running, android can terminate the BR when out of onReceive()
    - therefore cant start sync operations eg start activity using startActivityForResult() or a Dialog







#### Debugging tips

- log extra intent resolution information
    - Intent.setFlat(FLAG_DEGUB_LOG_RESOLUTION);
    - use adb tool 
        - % adb shell dumpsys activity b - for dymanically registered
        - % adb shell dumpsys package - for statically registered


