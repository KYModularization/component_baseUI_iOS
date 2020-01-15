#
# Be sure to run `pod lib lint component_baseUI_iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'component_baseUI_iOS'
  s.version          = '0.0.2'
  s.summary          = '快医科技UI基础类'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/KYModularization/component_baseUI_iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liangyujuan' => '18730231873@163.com' }
  s.source           = { :git => 'https://github.com/KYModularization/component_baseUI_iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'component_baseUI_iOS/Classes/**/*'
  
  # s.resource_bundles = {
  #   'component_baseUI_iOS' => ['component_baseUI_iOS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SDWebImage', '~> 4.2.3'
   s.dependency 'Masonry', '~> 1.1'
   s.dependency 'MBProgressHUD', '~> 0.9.1'
end
