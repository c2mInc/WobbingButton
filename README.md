![WobbingButton](https://github.com/c2mInc/WobbingButton/blob/master/wobbingbutton_logo.png?raw=true)

UIButton is not enough. Replace it with a lightweight control, the WobbingButton.

WobbingButton is a subclass of UIControl, it is a hassle free, storyboard friendly UI component.
You could set corner radius directly from storyboard as well as wobble scale, handle target functions as closures, drag drop nested components. Unchain the limits of UIButton.

![WobbingButton: A lightweight storyboard friendly UIButton replacement.](https://github.com/c2mInc/WobbingButton/blob/master/WobbingButton.gif?raw=true)

## Example

Try it!

`pod try 'WobbingButton'` 

This will open up an example project which you'll have a quick insight about the library.

## Installation

WobbingButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WobbingButton'
```
Alternatively drag and drop WobbingButton.swift file into your project.

### WobbingButton
`WobbingButton` is a UIControl subclass.

![RoundedWobbingButton` has rounded left and right corners](https://github.com/c2mInc/WobbingButton/blob/master/ss2.png?raw=true)

### RoundedWobbingButton
`RoundedWobbingButton` is a WobbingButton subclass, it has rounded left and right corners.

![RoundedWobbingButton` has rounded left and right corners](https://github.com/c2mInc/WobbingButton/blob/master/ss3.png?raw=true)

### WobbingControlWithIcon
`WobbingControlWithIcon` is too a WobbingButton subclass, it is best used with monochrome icons, set tintColor in storyboard.

![WobbingControlWithIcon` is best used with monochrome icons.](https://github.com/c2mInc/WobbingButton/blob/master/ss4.png?raw=true)

## Basic Usage

Drag a UIView into a viewcontroller, change its class type to `WobbingButton`, `RoundedWobbingButton` or `WobbingControlWithIcon`. Add a background color, you are set, start wobbling.

Sometimes it's quite useful to assign closures rather than adding target to methods. WobbingButton provides `onTapAction` and `onLongPressAction` closures to handle those actions gracefully. In addition to touch events like `.touchUpInside`, `.touchDown`, it works with tap and long press closures as well. 

```swift
let wobbingButton = WobbingButton(frame: ...)
wobbingButton.onTapAction = { [weak self] in
  //  self?.wobbingButtonTapped()
}
```

Even long presses.
```swift
let wobbingButton = WobbingButton(frame: ...)
wobbingButton.onLongPressAction = { [weak self] in
  //  self?.wobbingButtonLongPressed()
}
```

## Requirements

* iOS 9.0+
* Xcode 8.0+
* Swift 3.0+

## Author
[Connected2.me](http://connected2.me) / <a href="mailto:erkekin@gmail.com">Erk Ekin</a> <a href="https://twitter.com/erkekin">@erkekin</a>

Awesome logo: <a href="https://twitter.com/berilKarabulut">@berilKarabulut</a>

## License

WobbingButton is available under the MIT license. See the LICENSE file for more info.

Copyright (c) 2018 erkekin <erkekin@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

