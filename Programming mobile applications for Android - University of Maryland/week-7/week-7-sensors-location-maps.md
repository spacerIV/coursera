Sensors
========================

### SensorManager

- get a reference to manager 

    getSystemService( Context.SENSOR_SERVICE );

- specific sensor 

    SensorManager.getDefaultSensor( int type )

- Sensor.TYPE_ACCELOROMETER
- Sensor.TYPE_MAGNETIC_FIELD etc..

### Sensor Events

- interface SensorEventListener, implementing this, you must define the methods onAccruacyChanged & onSensorChanged ...

- when accruacy of sensor changed 

    void onAccruacyChanged( sensor int, accruacy ) 

- when sensor values have changed. 

    void onSensorChanged (int sensor, float[] values)

- register sensorListener

    public boolean registerListener( SensorEventListener listener, Sensor sensor, int rate )

- unregister ( save battery )

    public void  unRegisterListener( SensorEventListener listener, Sensor sensor )

### Sensor Filtering

- use transforms to smooth values..

- low pass : spirit level 

    - demphasise transient changes
    - emphasise constant changes

        private final float mAlpha = 0.8f; 

        // Deemphasize transient forces
        private float lowPass(float current, float gravity) {

            return gravity * mAlpha + current * (1 - mAlpha);

        }   


- high pass : game, instrument 

    - emphasise transient changes
    - demphasise constant changes

        // Deemphasize constant forces
        private float highPass(float current, float gravity) {

            return current - gravity;

        }   


    


