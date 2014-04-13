Week 3 Fragments
================

- Added in 3.0
- bigger screens, tablets
- represent a portion of an activities ui

## Fragment lifecycle

- tied to lifecycle of host activity
- running / resumed state = visible
- paused state , another activity is in the foreground and has focus, containing activity is visible
- stopped, not visible

### Fragment lifecycle callback methods

- activity.onCreate()
    - fragment.onAttach()  
    - fragment.onCreate() - initialize fragment
    - fragment.onCreateView() - sets up and returns a view of the fragment ui
    - fragment.onActivityCreated() - containing activity has completed onCreate() and fragment is installed
- activity.onStart()
    - fragment.onStart()
- activity.onResume()
    - fragment.onResume()
- activity.onPause()
    - fragment.onPause()
- activity.onStop()
    - fragment.onStop()
- when fragment is detached from activity 
    -the fragment receives call to onDestroyView(), same view as created by onCreateView() 
    - here cleanup resources associated with view.
- during activity.onDestory()
    - fragment.onDestroy & fragment.onDestroyView()
    - fragment.onDetach - you should null out references to host activity 

## adding fragments to activities

### static - add fragment to layout xml

- declare fragments in layout.xml, use fragment & class xml tag to define fragment class
- use setContentView(layout.xml) code in onCreate()
- create a fragment specific layout.xml file
- call inflater.inflate(layout.xml) in onCreateView(), and return the view

- layout/main.xml

```xml
      <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
           android:layout_width="match_parent"
           android:layout_height="match_parent"
           android:baselineAligned="false"
           android:orientation="horizontal" >
   
           <fragment
              android:id="@+id/titles"
              android:layout_width="0px"
              android:layout_height="match_parent"
              android:layout_weight="2"
             class="course.examples.Fragments.StaticConfigLayout.TitlesFragment" />
```

- code

      public class foo extends Activity
         @Override
         protected void onCreate( Bundle saveInstance...
             super.onCreate( savedIn... 
             setContentView ( layout/main.xml );  
             mDetailsFragment = (QuotesFragment) getFragmentManager().findFragmentById(R.id.details);
             ...

      public class QuotesFragment extends Fragment 

      @Override
      public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) 
          
          return inflater.inflate(R.layout.quote_fragment, container, false);

### programatically - use FragmentManager 

- when an activity is running, you can fragments to its layout, do these 4 things..
    - get reference to FragmentManager
    - begin fragment transaction
    - add fragment to activity
    - commit transaction

- layout/main.xml

```xml
    <LinearLayout 
        ... 
        ...
        <FrameLayout
            width...
            height...
            id...
            ( holding place for fragment ) >
        </FrameLayout>

        <FrameLayout
            width...
            height...
            id...
            ( holding place for fragment ) >
        </FrameLayout>
```

- code

      public class foo extends Activity

         @Override
         protected void onCreate( Bundle saveInstance...
             super.onCreate( savedIn... 
             setContentView ( layout/main.xml );  

             FragmentManager fragmentManager = getFragmentManager();
             FragmentTransaction fragmentTransaction = fragmentManager
                      .beginTransaction();
             fragmentTransaction.add(R.id.title_frame, new TitlesFragment());
             fragmentTransaction.add(R.id.quote_frame, mQuoteFragment);
             fragmentTransaction.commit();

### dynamically adding and removing fragments

- use fragmentTransaciton.addtoBackStack(null), so when fragment is no longer active, it is removed -- eg back button pressed
- use fragmentTransaciton.executePendingTransactions() after commit(), to force transaction to happen.

### Configuration changes

- eg orientation, font changes...
- for fragments, call setRetainInstance(true), then android wont destroy fragment on configuration changes, even if activty is destroyed.
    - therefore wont receive called to onDestroy() nor onCreate()
    - call it in fragment.onCreate()
    - if config change does occur, handle stuff in fragment.onActivityCreated() method , eg set listItemChecked() on listview to check the list item that
      was checked before the config change happened.

