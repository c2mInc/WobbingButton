#
# Be sure to run `pod lib lint WobbingButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WobbingButton'
  s.version          = '1.0.3'
  s.summary          = 'A storyboard friendly UIButton replacement. It wobbs too!'
  s.swift_version    = '4.2'
  s.description      = <<-DESC
UIButton is not enough. Replace it now.
WobbingButton is a UIControl, a hassle free storyboard friendly UI component.
You could set corner radius directly from storyboard. Notice how it "wobbles"!
RoundedWobbingButton is a WobbingButton subclass, it has rounded left and right corners.
WobbingControlWithIcon is a WobbingButton subclass, is best used with monochrome icons, set tintColor in storyboard.
                       DESC

  s.homepage         = 'https://github.com/c2mInc/WobbingButton'
  s.screenshots     = 'https://github.com/c2mInc/WobbingButton/blob/master/ss1.png?raw=true', 'https://github.com/c2mInc/WobbingButton/blob/master/ss2.png?raw=true', 'https://github.com/c2mInc/WobbingButton/blob/master/ss3.png?raw=true', 'https://github.com/c2mInc/WobbingButton/blob/master/ss4.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erkekin' => 'erkekin@gmail.com' }
  s.source           = { :git => 'https://github.com/c2mInc/WobbingButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/erkekin'

  s.ios.deployment_target = '10.0'

  s.source_files = 'WobbingButton/Classes/*'
  
#   s.resource_bundles = {
#     'WobbingButton' => ['WobbingButton/Assets/*.png']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
