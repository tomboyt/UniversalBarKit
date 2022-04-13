Pod::Spec.new do |s|
  s.name             = 'UniversalBarKit'
  s.version          = '0.0.1'
  s.summary          = 'AnyBarKit of UniversalBarKit.'
  s.description      = <<-DESC
    AnyBarKit
                       DESC
  s.homepage         = 'https://github.com/tomboyt/UniversalBarKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tomboyt' => 'tomboyt@163.com' }
  s.source           = { :git => 'https://github.com/tomboyt/UniversalBarKit.git', :tag => '0.0.1' }
  s.ios.deployment_target = '9.0'
  s.static_framework  = true
  s.requires_arc      = true
  s.swift_versions    = '5.0'
  s.dependency 'lottie-ios'
#  s.source_files = 'UniversalBarKit/Classes/*.{swift,framework}'
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
#  s.subspec 'Vendors' do |nb|
#      nb.vendored_frameworks   = 'UniversalBarKit/Vendors/*.framework'
#      nb.preserve_paths        = 'UniversalBarKit/Vendors/*.framework'
#      end
end
