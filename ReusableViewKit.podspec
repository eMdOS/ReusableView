
Pod::Spec.new do |spec|
  
  spec.name = 'ReusableViewKit'
  spec.version = '1.0.0'

  spec.swift_version = '4.2'
  spec.ios.deployment_target = '11.0'

  spec.license = { :type => 'MIT', :file => "LICENSE" }
  spec.homepage = 'https://github.com/eMdOS/ReusableViewKit'
  spec.authors = { 'eMdOS' => 'emilio.ojeda.mendoza@gmail.com' }
  spec.summary = 'A useful framework with extensions and utilities for making development easier.'

  spec.source = { :git => 'https://github.com/eMdOS/ReusableViewKit.git', :tag => "v#{spec.version}" }
  spec.source_files = 'reusable view/sources/core/**/*.{swift}', 'reusable view/sources/table view/*.{swift}'

  spec.subspec 'TableViewSection' do |tableViewSection|
  	tableViewSection.source_files = 'reusable view/sources/table view section/*.{swift}'
  end

end
