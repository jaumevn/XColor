Pod::Spec.new do |spec|
  spec.name         = "XColor"
  spec.version      = "0.4"
  spec.summary      = "XColor is a color handling extension for UIColor written in Swift."
  spec.homepage     = "https://github.com/jaumevn/XColor"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.source       = { :git => "https://github.com/jaumevn/XColor.git", :tag => "#{spec.version}" }
  spec.author       = { "Jaume Vinas Navas" => "jaumevn@icloud.com" }

  spec.ios.deployment_target = '16.0'
  spec.watchos.deployment_target = '9.0'
  spec.tvos.deployment_target = '16.0'
  spec.macos.deployment_target = '13.0'
  spec.visionos.deployment_target = '1.0'

  spec.swift_version = '5.9'

  spec.source_files = 'Source/*.swift'
end
