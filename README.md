## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Swift 3/3.1, iOS 8+

## Installation

NFJDemoWindow is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NFJDemoWindow"
```

## Usage
Super easy! In your Application Delegate, just replace the following line:

```ruby
var window: UIWindow?
```
with this one:

```ruby
var window: UIWindow? = NFJDemoWindow()
```
this will use an NFJDemoWindow as your main window.

whenever you want to turn demo mode on/off just grab it and set its activated property. Something like this:

```ruby
guard let demoWindow = view.window as? NFJDemoWindow else { return }
demoWindow.activated = true
```


## Author

Nathan F Johnson, nathanfjohnson@me.com

## License

NFJDemoWindow is available under the MIT license. See the LICENSE file for more info.
