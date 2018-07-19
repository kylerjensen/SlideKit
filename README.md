# SlideKit 
[![](https://travis-ci.com/Kjens93/SlideKit.svg?branch=master)](https://travis-ci.com/Kjens93/SlideKit)
[![](https://img.shields.io/cocoapods/v/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)
[![](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Kjens93/SlideKit)
[![](https://img.shields.io/cocoapods/l/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)
[![](https://img.shields.io/cocoapods/p/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)
[![](https://img.shields.io/cocoapods/dt/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)


Soulfully slidey UINavigationController transitions.

Quickly and easily create onboarding flows with a background image or transparent top and bottom bars based on simple UINavigationController semantics.

<img src="https://user-images.githubusercontent.com/15389109/42902178-00605a04-8a8b-11e8-900e-d13efd090e32.gif" width="250px">

# Installation

## CocoaPods
```ruby
pod 'SlideKit'
```

## Carthage
```ruby
github "Kjens93/SlideKit"
```

# Programmatic Usage
```swift
import SlideKit

class CustomNavigationController: SlideNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Customize push and pop transition animation timings
        pushTransition.delay = 0.15
        pushTransition.duration = 0.45
        popTransition.springDampingRatio = 0.75
        popTransition.animationOptions = [.curveEaseInOut]
        popTransition.backgroundColor = .clear
        //etc...
        
        //Add a background image to navigation stack for onboarding experience
        let imageView = UIImageView(image: UIImage(named: "BackgroundImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = view.bounds
        imageView.autoResizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(imageView, at: 0)
        view.layoutIfNeeded()
        //etc...
        
        //Make the navigation bar transparent for a cleaner onboarding experience
        navigationBar.backgroundColor = .clear
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)  
        
    }

}
```

