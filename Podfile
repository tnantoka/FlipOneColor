# Uncomment this line to define a global platform for your project
# platform :ios, '6.0'

target 'FlipOneColor' do
  pod 'Realm'
  pod 'FontAwesomeKit/FontAwesome'
  pod 'VTAcknowledgementsViewController'
  pod 'YLMoment'
  pod 'FXForms'
  pod 'CJPAdController', '1.6.3'
end

target 'FlipOneColorTests' do
  pod 'Realm/Headers'
end

target 'FlipOneColor WatchKit Extension' do

end

target 'FlipOneColor WatchKit App' do

end

#use_frameworks!

post_install do |installer|
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods-FlipOneColor/Pods-FlipOneColor-acknowledgements.plist', 'FlipOneColor/Pods-FlipOneColor-acknowledgements.plist')
end

