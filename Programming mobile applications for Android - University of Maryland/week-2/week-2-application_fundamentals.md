Week 2 Application Fundamentals
===============================

### Activity Class

- gui
- single focused task

### Service

- long running background processes
- should be background thread
- supports interaction with remote process

### Broadcast receivers

- listen for and response to events on the device
- play role of sub in a pub/sub environment
- events are represented by the Intent class, and then broadcast
- broadcast receivers receives and responds to broasdcast events

### Content Providers

- allows multiple apps to store and share data
- database style interface
- handle ipc communication


## Resources 

### Strings

- 3 types of strings: strings, string arrays & plurals
- plurals are string arrays for quantities eg book, books
- stores in res/values folder 
    - accessed by other resources as @string/string_name
    - accessed by other java code as R.string.string_name
- can include html styling formatting
- res/values/strings.xml contains default string values
- res/values-it/strings.xml contains italian string values

```xml
         <resources>
         <string name="app_name">HelloAndroid</string>
         <string name="action_settings">Settings</string>
         <string name="hello_world">Hello world!</string>
         </resources>
```

### Layout

- ui layout
- stored in res/layout/*.xml
    - accessed by resources as @layout/layout_name
    - accessed by java code as R.layout.layout_name
- multiple layout files by 
    - screen size
    - deivce
    - orientation ( res/layout-land/ for landscape mode )

### R class

- at compile time, resources used to generate R.java
- java code can access resources

### onCreate method

- restore saved state by calling super.onCreate( savedInstanceState ) -- must be called.
- saveInstanceState is type Bundle
- setContentView(R.layout.main)
- set content view
- initialize ui elements
- attach code to ui elements eg: OnClickListeners etc

## Package Application

- adt tools packge components and resources into .apk
- AndroidManifest.xml
    - contains packaging information
    - app name, list of components, permissions, hardware features (camera), min & target sdk version etc

```xml
        <manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="course.example.helloandroid"
          android:versionCode="1"
          android:versionName="1.0" >
          <uses-sdk
              android:minSdkVersion="8"
              android:targetSdkVersion="19" />
          <application
              android:allowBackup="true"
              android:icon="@drawable/ic_launcher"
              android:label="@string/app_name"
              android:theme="@style/AppTheme" >
              <activity
                  android:name="course.example.helloandroid.MainActivity"
                  android:label="@string/app_name" >
                  <intent-filter>
                      <action android:name="android.intent.action.MAIN" />
  
                      <category android:name="android.intent.category.LAUNCHER" />
                  </intent-filter>
              </activity>
          </application>
        </manifest>
```


