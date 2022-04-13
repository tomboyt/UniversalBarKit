Pod::Spec.new do |s|
  s.name             = 'UniversalBarKit'
  s.version          = '0.0.1'
  s.summary          = 'AnyBarKit'
  s.description      = <<-DESC
  AnyBarKit of UniversalBarKit.
                       DESC
  s.homepage         = 'https://github.com/tomboyt/UniversalBarKit'
  s.source           = { :git => 'https://github.com/tomboyt/UniversalBarKit.git', :tag => '0.0.1' }
  s.license          = 'Public'
  s.author           = { 'tomboyt' => 'tomboyt@163.com' }
  s.source_files = 'UniversalBarKit/**/*.{swift,framework}'
  s.static_framework  = true
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  s.requires_arc      = true
  s.platform = :ios, '9.0'
  s.swift_versions    = '5.0'
  s.dependency 'lottie-ios'
  #s.default_subspec = "Vendors"
  s.subspec 'Vendors' do |ss|
      ss.vendored_frameworks   = 'UniversalBarKit/Vendors/*.framework'
      ss.preserve_paths        = 'UniversalBarKit/Vendors/*.framework'
      end
end
