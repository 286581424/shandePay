
Pod::Spec.new do |s|
  s.name         = "RNShandePay"
  s.version      = "1.0.0"
  s.summary      = "RNShandePay"
  s.description  = <<-DESC
                  RNShandePay
                   DESC
  s.homepage     = "https://github.com/author/RNShandePay.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNShandePay.git", :tag => "master" }
  s.source_files  = "RNShandePay/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  