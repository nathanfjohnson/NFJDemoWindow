Pod::Spec.new do |s|
  s.name             = 'NFJDemoWindow'
  s.version          = '0.1'
  s.summary          = 'Have touches on your app presented on screen. Good for screencasts and Demos.'
  s.description      = <<-DESC
When activated, a spot will be animated in/out wherever the uses touches the screen. This is useful when demoing an app to a group over a projector, or similar situations.
                       DESC

  s.homepage         = 'https://github.com/nathanfjohnson/NFJDemoWindow'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nathan F Johnson' => 'nathanfjohnson@me.com' }
  s.source           = { :git => 'https://github.com/nathanfjohnson/NFJDemoWindow.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nathanfjohnson'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NFJDemoWindow/Classes/**/*'

  s.frameworks = 'UIKit', 'MapKit'
end
