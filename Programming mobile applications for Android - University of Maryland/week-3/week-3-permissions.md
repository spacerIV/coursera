Permissions
============

- Protects resources and data 
- limit access
- declares as strings in androidmanifest.xml

```xml
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"></uses-permission>
```

- can define and enforce you own permission.

```xml
      <permission
          android:name="course.examples.permissionexample.BOOM_PERM"
          android:description="@string/boom_perm_string"
          android:label="@string/boom_permission_label_string">
      </permission>
```

- if a permission tag is defined in the application tag, then permission must have been granted to run the program.

```xml
     <application
          android:allowBackup="true"
          android:icon="@drawable/ic_launcher"
          android:label="@string/app_name"
          android:permission="course.examples.permissionexample.BOOM_PERM" >
          <activity
              android:name=".BoomActivity"
```
- individual ocmponents can set their own permissions, restricting which components can access them
- component permissions take precedence of application level permissions

### activity permissions 

- restricts which compnonents can start it using startActivity or startActivityForResult
- throws security exception

### service permissions 

- restricts which components can start or bind to service
- checked within Context.startService() & Context.stopService() & Context.bindService()
- throws security exception


### Broadcast Receiver permissions 
- restricts which components can send or receive broadcasts
- permissions checked in mltiple places

### Content Provider permissions 
- restricts which components can read or write data in a contentproivder
- permissions checked in mltiple places

