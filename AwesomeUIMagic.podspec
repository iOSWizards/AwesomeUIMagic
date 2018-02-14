#
# Be sure to run `pod lib lint AwesomeUIMagic.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AwesomeUIMagic'
  s.version          = '0.4.1'
  s.summary          = 'Unlock Magic on your UI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Your UI has never been so powerful.
                       DESC

  s.homepage         = 'https://github.com/iOSWizards/AwesomeUIMagic'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Evandro Harrison Hoffmann, Leonardo Kaminski Ferreira' => 'evandro@itsdayoff.com, leonardo@mindvalley.com' }
  s.source           = { :git => 'https://github.com/iOSWizards/AwesomeUIMagic.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AwesomeUIMagic/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AwesomeUIMagic' => ['AwesomeUIMagic/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
