# WobbingButton

UIButton is not enough. Replace it now.

WobbingButton is a UIControl, a hassle free storyboard friendly UI component.
You could set corner radius directly from storyboard as well as wobble scale.

![WobbingButton: A lightweight storyboard friendly UIButton replacement.](https://github.com/erkekin/WobbingButton/blob/master/WobbingButton.gif?raw=true)

## Example

Try it!

`pod try 'WobbingButton'` 

This will open up an example project which you'll have a quick insight about he library.

## Requirements
iOS9+

## Installation

WobbingButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WobbingButton'
```

Drag a UIView into a viewcontroller, change its class type to `WobbingButton`, `RoundedWobbingButton` or `WobbingControlWithIcon`. Add a background color, you are set, start wobbling.

### WobbingButton
`WobbingButton` is a UIControl subclass.

![RoundedWobbingButton` has rounded left and right corners](https://github.com/erkekin/WobbingButton/blob/master/ss2.png?raw=true)

### RoundedWobbingButton
`RoundedWobbingButton` is a WobbingButton subclass, it has rounded left and right corners.

![RoundedWobbingButton` has rounded left and right corners](https://github.com/erkekin/WobbingButton/blob/master/ss3.png?raw=true)

### WobbingControlWithIcon
`WobbingControlWithIcon` is too a WobbingButton subclass, it is best used with monochrome icons, set tintColor in storyboard.

![WobbingControlWithIcon` is best used with monochrome icons.](https://github.com/erkekin/WobbingButton/blob/master/ss4.png?raw=true)

## Basic Usage
You can handle taps.
```swift
let wobbingButton = WobbingButton(frame: ...)
wobbingButton.onTapAction = { [weak self] in
    self?.wobbingButtonTapped()
}
```

Even long presses.
```swift
let wobbingButton = WobbingButton(frame: ...)
wobbingButton.onLongPressAction = { [weak self] in
    self?.wobbingButtonLongPressed()
}
```

## Author

Connected2.me

erkekin, erkekin@gmail.com

## License

WobbingButton is available under the MIT license. See the LICENSE file for more info.
