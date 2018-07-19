#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html

Pod::Spec.new do |s|

  s.name             = "SlideKit"
  s.version          = "0.0.1"
  s.summary          = "Soulfully slidey UINavigationController transitions"
  s.description      = "Quickly and easily create onboarding flows with a background image or transparent top and bottom bars based on simple UINavigationController semantics"
  s.author           = "Kyler Jensen"
  s.homepage         = "https://github.com/Kjens93/SlideKit"
  s.screenshots      = "https://user-images.githubusercontent.com/15389109/42902178-00605a04-8a8b-11e8-900e-d13efd090e32.gif"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  
  s.source           = { :git => "#{s.homepage}.git", :tag => s.version }
  s.source_files     = "SlideKit/**/*.{h,m,swift}"

  s.platform         = :ios, "10.0"
  s.swift_version    = "4.1"

  s.frameworks       = "UIKit"

end
