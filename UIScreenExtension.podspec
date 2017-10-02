Pod::Spec.new do |s|

  s.name         = "UIScreenExtension"
  s.version      = "0.0.1"
  s.summary      = "An extension to UIScreen that offers information about the pixel density (or point density) of iPhones and iPads."
  s.description  = <<-DESC
  This extension offers information about the pixel/point density measured in either pixels/points per centimeter/inch (PPI/PPCM). This can for example be used to draw a ruler or to show ECG graph on the iPhone's screen.
                   DESC

  s.homepage     = "https://github.com/marchv/UIScreenExtension"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Jens Schwarzer" => "jens.schwarzer@marchv.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/marchv/UIScreenExtension.git", :tag => s.version }
  s.source_files = "UIScreenExtension", "UIScreenExtension/**/*.{h,swift}"
end
