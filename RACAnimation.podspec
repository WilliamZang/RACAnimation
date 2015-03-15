Pod::Spec.new do |s|
  s.name         = "RACAnimation"
  s.version      = "0.0.1"
  s.summary      = "A new animation framework with ReactiveCocoa."

  s.description  = <<-DESC
                   _It's a easy way to make animations with ReactiveCocoa.
                   DESC

  s.homepage     = "https://github.com/WilliamZang/RACAnimation"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "WilliamZang" => "chengwei.zang.1985@gmail.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/WilliamZang/RACAnimation.git", :tag => "0.0.1" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.requires_arc = true

  s.dependency "ReactiveCocoa", "~> 2.4.7"
  s.dependency "RBBAnimation", "~> 0.3.0"

end
