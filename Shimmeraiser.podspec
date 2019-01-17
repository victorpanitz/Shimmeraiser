Pod::Spec.new do |s|
  s.name             = 'Shimmeraiser'
  s.version          = '1.0.2'
  s.summary          = 'Shimmeraiser implements a Shimmer enabling your to configure colors, animation duration, sizes and much more.'

  s.homepage         = 'https://github.com/victorpanitz/Shimmeraiser'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Victor Panitz Magalhães' => 'victorpanitz@gmail.com' }
  s.source           = { :git => 'https://github.com/victorpanitz/Shimmeraiser.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/victorpmagalhaes/'
  s.swift_version = '4.0'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Shimmeraiser/Classes/**/*'
  s.frameworks = 'UIKit'
  s.source_files = "Shimmeraiser/**/*.{swift}"

end
