Pod::Spec.new do |s|
  s.name         = "CompensateTimer"
  s.version      = "0.0.1"
  s.summary      = "CompensateTimer prevents timer drift"
  s.homepage     = "https://github.com/egul/compensatetimer"
  s.license      = "MIT"
  s.author       = { "Evan" => "evangulyas@outlook.com" }
  s.source       = { :git => "https://github.com/egu/compensatetimer.git", :tag => s.version }
  s.source_files = "CompensateTimer/CompensateTimer.{h, m}"
  s.public_header_files = "CompensateTimer/CompensateTimer.h"
end
