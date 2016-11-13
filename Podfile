# Uncomment this line to define a global platform for your project

# Pods for BookSharing
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!
target 'BookSharing' do
    	pod 'Alamofire', '~> 4.0'
	pod 'SwiftyJSON'
	pod 'SideMenuController', '~> 0.2.0'
	pod "PagingMenuController"

	post_install do |installer|
	 installer.pods_project.targets.each do |target|
	   target.build_configurations.each do |config|
	     config.build_settings['SWIFT_VERSION'] = '3.0'
	   end
	 end
	end
end
