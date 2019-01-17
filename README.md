![Alt text](https://i.imgur.com/LCQQn07.jpg)

[![Version](https://img.shields.io/cocoapods/v/Shimmeraiser.svg?style=flat)](https://cocoapods.org/pods/Shimmeraiser)
[![License](https://img.shields.io/cocoapods/l/Shimmeraiser.svg?style=flat)](https://cocoapods.org/pods/Shimmeraiser)
[![Platform](https://img.shields.io/cocoapods/p/Shimmeraiser.svg?style=flat)](https://cocoapods.org/pods/Shimmeraiser)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Shimmeraiser is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Shimmeraiser'
```

## Using Shimmeraiser

![Alt text](https://media.giphy.com/media/9M5hqYJ6X9rkfztQ4O/giphy.gif)


###### *Shimmeraiser* is actually 95%+ covered by tests

![Alt text](https://i.imgur.com/9svuJQA.png)

##### Step 1: Create a Shimmerable Class.

This class corresponds to the respective layout you want to represent when loading the content. In this file you needs basically to import *Shimmeraiser* and add all CGRects provided by your UX team to a *ShimmerBuilder* object. You need to return a ShimmerSettings which you can use the default init or set your own parameters as the animation duration, if the animation is reversible, the size of the animated shadow, and the color.


![Alt text](https://i.imgur.com/yYtQIUS.jpg)

- WELL DONE! Only few steps to finish your Shimmer :)

##### Step 2: Run your shimmer!

🔥🔥 Shimmeraiser is pretty simple! As Shimmer is static, you don't need even to initialize it.  🔥🔥

To show your own shimmer, just call on your UIViewController 

```swift
Shimmer.show(MyCustomShimmer(), in: self)
```

and to hide, more simple

```swift
Shimmer.hide()
```

Done! A good experience was added to your application.


## Author

Victor Panitz Magalhães, victorpanitz@gmail.com

## License

Shimmeraiser is available under the MIT license. See the LICENSE file for more info.
