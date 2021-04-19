Pod::Spec.new do |s|
  s.name             = 'TailWind'
  s.version          = '0.1.0'
  s.summary          = '提供给Swift开发的一些工具库.'

  s.description      = <<-DESC
提供swift语言开发的工具组件等功能
                       DESC

  s.homepage         = 'https://github.com/liunina/TailWind'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'i19850511@gmail.com' => 'i19850511@gmail.com' }
  s.source           = { :git => 'https://github.com/liunina/TailWind.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'TailWind/Classes/*'
  
  s.subspec 'ViewModel' do |ss|
	  ss.public_header_files = 'TailWind/Classes/ViewModel/*.swift'
	  ss.source_files = 'TailWind/Classes/ViewModel/*.swift'
  end
  
  s.frameworks = 'UIKit'
  
  # s.resource_bundles = {
  #   'TailWind' => ['TailWind/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  
  # s.dependency 'AFNetworking', '~> 2.3'
end
