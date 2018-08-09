# SlideKit 
[![](https://travis-ci.com/Kjens93/SlideKit.svg?branch=master)](https://travis-ci.com/Kjens93/SlideKit)
[![](https://api.codacy.com/project/badge/Grade/9a4bcdc62f534a28b7931486d3299e7e)](https://app.codacy.com/app/Kjens93/SlideKit)
[![](https://img.shields.io/cocoapods/v/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)
[![](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Kjens93/SlideKit)
[![](https://img.shields.io/cocoapods/l/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)
[![](https://img.shields.io/cocoapods/p/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)
[![](https://img.shields.io/cocoapods/dt/SlideKit.svg)](https://cocoapods.org/pods/SlideKit)


Soulfully slidey UINavigationController transitions.

Quickly and easily create onboarding flows with a background image or transparent top and bottom bars based on simple UINavigationController semantics.

<img src="https://user-images.githubusercontent.com/15389109/42902178-00605a04-8a8b-11e8-900e-d13efd090e32.gif" width="250px">

# Getting Started
SlideKit comes with several ways, with varying degrees of intrusiveness, to implement sliding push and pop transitions for `UINavigationController`. This section gives instructions for adding the framework to your project, as well as getting started using Interface Builder or just code.

## Adding SlideKit to Your iOS project
SlideKit can be installed using CocoaPods or Carthage.

<details>
<summary><strong>CocoaPods</strong></summary>

```ruby
pod 'SlideKit'
```

</details>

<details>
<summary><strong>Carthage</strong></summary>

```ruby
github "Kjens93/SlideKit"
```

</details>

## Using SlideKit
SlideKit can be used via Interface Builder, code, or a combination of the two.

### Using SlideKit with Interface Builder
To add slidey transitions to your navigation flow, just change your `UINavigationController` to an instance of `SlideNavigationController`.

<img src="https://user-images.githubusercontent.com/15389109/43020705-2a383d58-8c1e-11e8-8469-85e4a066f25e.gif" height="250px" >

Without writing a single line of code, your navigation flow will begin to move with slidey transitions. You can further customize your transitions in code by interacting with the `navigationController` of any view controller in your navigation flow. For example, you can change a push transition's spring damping ratio by adding the following code to your view controller's `viewWillAppear(animated:)` method:

```swift
import SlideKit

class ViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated: animated)
        let slideNavigationController = self.navigationController as? SlideNavigationController
        slideNavigationController?.pushTransition.springDampingRatio = 0.75
    }
    
}
```

As an alternative, you can create a subclass of `SlideNavigationController` and customize it in your subclass' `viewDidLoad()` method.

### Using SlideKit in Code

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

