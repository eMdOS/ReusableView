
Pod::Spec.new do |spec|
  
  spec.name = 'ReusableViewKit'
  spec.version = '1.0.0'

  spec.swift_version = '4.2'
  spec.ios.deployment_target = '11.0'

  spec.license = { :type => 'MIT', :file => "LICENSE" }
  spec.homepage = 'https://github.com/eMdOS/ReusableViewKit'
  spec.authors = { 'eMdOS' => 'emilio.ojeda.mendoza@gmail.com' }
  spec.summary = 'A useful framework with extensions and utilities for making development easier.'

  spec.source = { :git => 'https://github.com/eMdOS/ReusableViewKit.git', :tag => "#{spec.version}" }

  spec.frameworks = 'UIKit', 'Foundation'

  spec.default_subspec = 'Core'
  spec.source_files = 'framework/ReusableViewKit.h'

  spec.subspec 'Core' do |core|
    core.source_files = 'framework/sources/core/**/*.{swift}'
  end

  spec.subspec 'TableViewSection' do |tableViewSection|
  	tableViewSection.source_files = 'framework/sources/table view section/*.{swift}'
  end

end
