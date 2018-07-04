#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html

Pod::Spec.new do |s|

  s.name             = "JazzySlideKit"
  s.version          = "0.0.1"
  s.summary          = "JazzySlideKit for iOS"
  s.description      = "JazzySlideKit for iOS"
  s.author           = "Jazzy Components"
  s.homepage         = "https://github.com/JazzyComponents/JazzySlideKit"
  s.screenshots      = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license          = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  
  s.source           = { :git => "#{s.homepage}.git", :tag => s.version }
  s.source_files     = "JazzySlideKit/**/*.{h,m,swift}"

  s.platform         = :ios, "10.0"
  s.swift_version    = "4.2"

  s.frameworks       = "UIKit"

end
