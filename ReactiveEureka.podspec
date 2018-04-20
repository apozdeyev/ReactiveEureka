#
# Be sure to run `pod lib lint ReactiveEureka.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReactiveEureka'
  s.version          = '0.1.2'
  s.summary          = 'Reactive extension for xmartlabs/Eureka.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Reactive extension for xmartlabs/Eureka.
                       DESC

  s.homepage         = 'https://github.com/apozdeyev/ReactiveEureka'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anatoliy Pozdeyev' => 'anatoliy.pozdeyev@gmail.com' }
  s.source           = { :git => "https://github.com/apozdeyev/ReactiveEureka.git", :tag => "#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ReactiveEureka/Classes/**/*.{swift,h,m}'
  
  # s.resource_bundles = {
  #   'ReactiveEureka' => ['ReactiveEureka/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.dependency "ReactiveCocoa", "~> 7"
  s.dependency "Eureka", "~> 4"

end
