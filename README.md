# SlideKit [![Build Status](https://travis-ci.com/JazzyComponents/JazzySlideKit.svg)](https://travis-ci.com/Kjens93/SlideKit)
Soulfully slidey UINavigationController transitions.

Quickly and easily create onboarding flows with a background image or transparent top and bottom bars based on simple UINavigationController semantics.

# Installation

## CocoaPods
```ruby
pod 'SlideKit'
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

