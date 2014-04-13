Week 1
======

### Android SoftwareStack

![Stack](https://raw.github.com/vichou/Coursera-Android/master/pics/androidstack-1.jpg)

### Emulator

Run an emulator, and you can telnet into it using ..

    telnet localhost {port} 

issue commands eg: change the network state ..

    network speed edge
    network speed full

or battery status ..

    power capacity 5

or power status (not charging) ..

    power status not-charging

geo location

    geo fix 0.00 40.00

sending a txt message

    sms send 3015555555 "This is a text message"

make two emulators phone each other, 
    
    call the port number of the other emulator (on window titlebar)

### Debugger

Dalvil Debug Monitor Service includes

- file explorer
- logcat    
- traceview 
- hierarchyview

### links

### eclipse environment

-  use Open Call Hierarchy to find where an id in R.java is called by findViewById()
-  DDMS Dump View Hierarchy for UI Automator, to view running UI hierarchy of views 
- method profiling, exclusive and inclusive method timings - just like nytprof.

Dalvik VM Talk on [Youtube:](http://www.youtube.com/watch?v=ptjedOZEXPM "").
    

