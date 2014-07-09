Threads AsyncTasks Handlers
=============================

### Threading Overview

- Concept: parallel computation running in a process
- each thread has a program counter and stack
- with heap and stack area that are shared with other threads
- eg cpu#2 can be running 2 processes, each process can have mutiple threads
- Threads in Java are represented by the Java.Lang.Thread package implement Runnable() must declare void Run().
- see http://docs.oracle.com/javase/tutorial/esssential/concurrency/threads.html
- thread methods
    - void start()
    - void sleep() 
    - void wiat() - current thread wait until another thread invokes notify() or notifyAll()
    - void notifty() - wakes up a thread
- Use Case    
    - Instantiate a thread object and define run() method
    - invoke start() method, and the threads Run() method is called

### UI Thread 

- Now java thread wont allow other Threads to manage stuff on the UI thread
- Android gives some methods that will defo run on UI thread
    - boolean View.post( Runnable action )
    - void Activity.runOnUiThread( Runnable action ) - runnable has code to update UI 

### AsyncTask 

- provides access to ui thread and a background thread
- ui 
    - does setup
    - publish intermediate results
    - uses results
- background
    - performs work
    - indicates progress

- AsyncTask is generic class

     class AsyncTask<Params, Progress, Result>{
         ...
     }

- void onPreExecute(): ui thread before doInBackground()
- Result doInBackGround(): on bg thread, optionally calling void publishProgress( Progress.. values)
    - if so onProgressUpdate( Progress ..values ) will be called
- void onPostExecute(Result result) on ui thread

### Handler Class

- works to help any threads, not just background and ui thread
- each handler is associated to a thread
- one thread can hand off work to another thread by sending messages & posting runnables to a handler associated with another thread.
- Runnable
    - contains an instance of the runnable interace
    - sender implements response
- Message
    - can contain data eg: message code, an object , integers 
    - handler implements the response

#### Handler Architecture

![Handler Architecture](https://raw.github.com/vichou/coursera/master/Programming%20mobile%20applications%20for%20Android%20-%20University%20of%20Maryland/pics/androidhandlearch.png)

- Runnable

![With Runnable](https://raw.github.com/vichou/coursera/master/Programming%20mobile%20applications%20for%20Android%20-%20University%20of%20Maryland/pics/androidhandlerarchrunnable.png)

- Message

![With Message](https://raw.github.com/vichou/coursera/master/Programming%20mobile%20applications%20for%20Android%20-%20University%20of%20Maryland/pics/androidhandlerarchmessage.png)

- Looper Runnable

![Looper Runnable](https://raw.github.com/vichou/coursera/master/Programming%20mobile%20applications%20for%20Android%20-%20University%20of%20Maryland/pics/androidhandlerarchlooperrunnable.png)

- Looper Message

![Looper Message](https://raw.github.com/vichou/coursera/master/Programming%20mobile%20applications%20for%20Android%20-%20University%20of%20Maryland/pics/androidhandlerarchloopermessage.png)

#### Runnables & Handlers

- boolean post(Runnable r) : add runnable to message queue
- boolean postAtTime(Runnable r, long uptimeMillis) : add runnable to message queue, run at specific time
- boolean postDelayed(Runnable r, long delayMillis) : add runnable to message queue, run after specific time has elapsed

#### Messages & Handlers

- Create message & set Message content Handler.obtainMessage()
- Message.obtain()
- numerous and varied ways to use messages, see docs!
- sendMessage()
- sendMessageAtFrontOfQueue()
- sendMessageAtTime()
- sendMessageDelayed()






