#
# Be sure to run `pod lib lint WobbingButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WobbingButton'
  s.version          = '0.1.0'
  s.summary          = 'A must have UIButton replacement.'
  s.swift_version    = '4.2'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UIButton is dead. Replace it with my awesome WobbingButton.
                       DESC

  s.homepage         = 'https://github.com/erkekin/WobbingButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erkekin' => 'erkekin@gmail.com' }
  s.source           = { :git => 'https://github.com/erkekin/WobbingButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/erkekin'

  s.ios.deployment_target = '9.0'

  s.source_files = 'WobbingButton/Classes/*'
  
#   s.resource_bundles = {
#     'WobbingButton' => ['WobbingButton/Assets/*.png']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
