# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
use_frameworks!

def stocket_pods
  # Pods for StocketiOS
  pod 'AppCenter'
  pod 'Firebase/Analytics'
  pod 'OneSignal', '>= 2.11.2', '< 3.0'
end

target 'Production' do
  stocket_pods
end

target 'Development' do
  stocket_pods
end

target 'OneSignalNotificationServiceExtension' do
  pod 'OneSignal', '>= 2.11.2', '< 3.0'
end
