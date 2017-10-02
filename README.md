# UIScreenExtension

This is an extension to UIScreen that provides information about the pixel density (or point density) of iPhones and iPads. This can for example be used to draw a ruler or to show a proper ECG graph on the iPhone's screen.

    public extension UIScreen {
    
        /// The number of pixels per inch for this device
        public static let pixelsPerInch: CGFloat?
        
        /// The number of pixels per centimeter for this device
        public static let pixelsPerCentimeter: CGFloat?
        
        /// The number of points per inch for this device
        public static let pointsPerInch: CGFloat?
        
        /// The number of points per centimeter for this device
        public static let pointsPerCentimeter: CGFloat?
    }

The constants will be set to `.none` if the device is unknown. This can happen if Apple releases a new iPhone, so please remember to deal with this in your code.


## Installation and use

The extension can be installed using [Cocoapods](https://cocoapods.org/) by adding below line to your `Podfile`:

    pod 'UIScreenExtension', :git => 'https://github.com/marchv/UIScreenExtension'

To use the extension in your code first import it by adding:

    import UIScreenExtension
    
And then use it:

    if let pointsPerCentimeter = UIScreen.pointsPerCentimeter {
       // code
    }

## Support

The extension supports all iPhones, iPods and iPads that are supported by iOS 9-11.


## Limitations

Please note that iPhone only apps upscaled on iPads will not work properly!


## Improvements

* Apple Watch support
* Objective C support
* Fetch information about new iPhone models from internet

## Author

jens.schwarzer@marchv.com

:)
