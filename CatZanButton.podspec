Pod::Spec.new do |s|

  s.name         = "CatZanButton"
  s.version      = "1.2.0"
  s.summary      = "A animation button for Zan."
  s.homepage     = "https://github.com/K-cat/CatZanButton"
  s.license      = "MIT"
  s.author             = { "K-cat" => "kcatismyname@icloud.com" }
  s.ios.deployment_target = "5.0"
  s.source       = { :git => "https://github.com/K-cat/CatZanButton.git", :tag => "#{s.version}" }
  s.source_files  = "CatZanButton/CatZanButton/*.{h,m}"
  s.resource     =  "CatZanButton/CatZanButton/*.png"
  s.frameworks = "UIKit", "QuartzCore"
  s.requires_arc = true
end
