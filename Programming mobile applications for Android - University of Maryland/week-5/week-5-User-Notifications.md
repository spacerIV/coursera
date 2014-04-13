User Notifications 
========================


### Toasts

- Toasts with custom layouts in xml
   - toast.setView( inflate view layout xml )

### Notification Drawer

-Notifications
   - Must have title, detail, small icon

- Notification Area
    - ticker text, small icon

- Notification Drawer
   - view 
   - action

### Nottification Manager

- System service to manage notifications

- Steps to follow to create custom notification on button press
    - Use, notification id, notification elements (ticket, icon etc), sounds, vibrations, Intents, PendingIntents, NotificationBuilder

    public class NotificationStatusBarWithCustomViewActivity extends Activity {
    
        // Notification ID to allow for future updates
        private static final int MY_NOTIFICATION_ID = 1;
    
        // Notification Count
        private int mNotificationCount;
    
        // Notification Text Elements
        private final CharSequence tickerText = "This is a Really, Really, Super Long Notification Message!";
        private final CharSequence contentTitle = "Notification";
        private final CharSequence contentText = "You've Been Notified!";
    
        // Notification Action Elements
        private Intent mNotificationIntent;
        private PendingIntent mContentIntent;
    
        // Notification Sound and Vibration on Arrival
        private Uri soundURI = Uri 
                .parse("android.resource://course.examples.Notification.StatusBar/"
                        + R.raw.alarm_rooster);
        private long[] mVibratePattern = { 0, 200, 200, 300 };
    
        RemoteViews mContentView = new RemoteViews(
                "course.examples.Notification.StatusBarWithCustomView",
                R.layout.custom_notification);
    
        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
    
            setContentView(R.layout.main);
    
            mNotificationIntent = new Intent(getApplicationContext(),
                    NotificationSubActivity.class);
            mContentIntent = PendingIntent.getActivity(getApplicationContext(), 0,
                    mNotificationIntent, Intent.FLAG_ACTIVITY_NEW_TASK);
    
            final Button button = (Button) findViewById(R.id.button1);
            button.setOnClickListener(new OnClickListener() {
    
                @Override
                public void onClick(View v) {


                // Define the Notification's expanded message and Intent:

                mContentView.setTextViewText(R.id.text, contentText + " ("
                        + ++mNotificationCount + ")");

                // Build the Notification

                Notification.Builder notificationBuilder = new Notification.Builder(
                        getApplicationContext())
                    .setTicker(tickerText)
                    .setSmallIcon(android.R.drawable.stat_sys_warning)
                    .setAutoCancel(true)
                    .setContentIntent(mContentIntent)
                    .setSound(soundURI)
                    .setVibrate(mVibratePattern)
                    .setContent(mContentView);

                // Pass the Notification to the NotificationManager:
                NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
                mNotificationManager.notify(MY_NOTIFICATION_ID,
                        notificationBuilder.build());

            }
        });

    }

