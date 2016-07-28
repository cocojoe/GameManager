# GameManager
SpriteKit, Swift, Singleton &amp; NSUserDefaults (Example)

### Outline
* Touch will increase the high score.  
* (Save Data) Send the app to the background.
* (Restore Data) Kill app and relaunch.
* A new character object will be added to the characters array each time the app is launched.

### Changelog
July 28, 2016

Added custom class and implemented *NSCoding* prototcol.
Converting an array of the custom class to *NSData* to allow for storage/retrieval in *NSUserDefaults*.
Implemented CustomStringConvertible to singleton for extra debug.

### Notes
Utilises the awesome [SwiftyUserDefaults](https://github.com/radex/SwiftyUserDefaults) for a Swifty experience.
