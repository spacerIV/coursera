Alarms
=======

### Alarms

- run in future, or every specified amount of time
- Mechanism for sending Intents
- once registered, alarms remain active if device is asleep
- can set configure alarms to wakre sleeping device
- alarms are cnacelled on device shutdown
- eg: MMS messages, use alarms to find msgs that havent been delivered and re-send them

### AlarmManager Service

This class provides access to the system alarm services. These allow you to schedule your application to be run at some point in the future. When an alarm goes off, the Intent that had been registered for it is broadcast by the system, automatically starting the target application if it is not already running. Registered alarms are retained while the device is asleep (and can optionally wake the device up if they go off during that time), but will be cleared if it is turned off and rebooted.

- get referenece using Context().getSystemService(Context.ALARM_SERVICE)
- use ref to create and set
- set()
    - on-shot alarm
    - void set( int type, long triggerAtTime, PendingIntent operation)

**API level > 19 (kitkat) alarm delivery is inexact**
**See Docs**

- setRepeating(...) 
    - repeating alarm
    - void setInexactRepeating(...) : more flexible, are batchable 
    - interval options eg : INTERVAL_DAY, INTERVAL_HALFDAY

### Alarm Types

- Two degress of configs
    - How to interpret time
        - realtime - relative to systemclock eg unix epoch
        - elapsed - time since boot
    - what to do if sleeping
        - wake up now to deliver intent
        - deliver intent until wake up

### Alarm Types

- RTC : fire alarm, but if asleep, dont wake up, but deliver intent when device wakes up
- RTC_WAKEUP : fire alarm at wall-clock time and wake-up
- ELAPSED_REALTIME : fire at time since boot, dont wake-up
- ELAPSED_REALTIME_WAKEUP : fire a time since boot and wake-up 

#### PendingIntent

A description of an Intent and target action to perform with it. Instances of this class are created with getActivity(Context, int, Intent, int), getActivities(Context, int, Intent[], int), getBroadcast(Context, int, Intent, int), and getService(Context, int, Intent, int); the returned object can be handed to other applications so that they can perform the action you described on your behalf at a later time.

- permission slip, allows one component to use Intent as if it were the first component
- create in 3 ways ...

![3 ways to create PendingIntent](https://raw.github.com/vichou/Coursera-Android/master/pics/androidalarmspendingintent.png)


