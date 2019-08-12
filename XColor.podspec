Pod::Spec.new do |spec|
  spec.name         = "XColor"
  spec.version      = "0.0.1"
  spec.summary      = "XColor is a color handling extension for UIColor written in Swift."
  spec.homepage     = "https://github.com/jaumevn/XColor"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.source       = { :git => "https://github.com/jaumevn/XColor.git", :tag => "#{spec.version}" }
  spec.author       = { "Jaume Vinas Navas" => "jaumevn@icloud.com" }

  spec.ios.deployment_target = '8.0'
  spec.swift_version = '5.0'

  spec.source_files = 'XColor/*.swift'
end