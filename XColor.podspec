Pod::Spec.new do |spec|
  spec.name         = "XColor"
  spec.version      = "0.2"
  spec.summary      = "XColor is a color handling extension for UIColor written in Swift."
  spec.homepage     = "https://github.com/jaumevn/XColor"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.source       = { :git => "https://github.com/jaumevn/XColor.git", :tag => "#{spec.version}" }
  spec.author       = { "Jaume Vinas Navas" => "jaumevn@icloud.com" }

  spec.ios.deployment_target = '8.0'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'
  spec.macos.deployment_target = '10.9'

  spec.swift_version = '5.0'

  spec.source_files = 'Source/*.swift'
end
