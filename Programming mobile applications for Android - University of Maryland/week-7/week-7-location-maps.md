Location
========

### Location class

- latitude, longitude & optionaly timestamp, accuracy, altitude, speed, bearing 

### LocationProivder Types

- Network Provider 
    - wifi & cell tower
    - requires either android.permission.ACCESS_COURSE_LOCATION or ACCESS_FINE_LOCATION
    - cheaper, less accruate, slower, availibility varies


- GPS Provider 
    - satellite 
    - requires either android.permission.ACCESS_FINE_LOCATION
    - most sensitive, must have clear view, most expensive battery

- Passive Provider
    - returns lcoation from other app using the above 
    - requires either android.permission.ACCESS_FINE_LOCATION
    - cheapest, fastest, least reliable

### LocationManager

- get reference by .. 

    getSystemService( COntext.LOCATION_SERVICE );

- get last reading 
- register location updates
- register to receive intents when devices nears or moves away from area

### LocationListener

- interface defines callbacks that are called when location or locationprovider changes

    abstract void    onLocationChanged(Location location) Called when the location has changed.

    abstract void    onProviderDisabled(String provider) Called when the provider is disabled by the user.

    abstract void    onProviderEnabled(String provider) Called when the provider is enabled by the user.

    abstract void    onStatusChanged(String provider, int status, Bundle extras) Called when the provider status changes.

### Obtain Location

- start listening for updates
- maintain current best estimate
- unregister listener when good enough
- remember to turn off updates from listener in onPause()

