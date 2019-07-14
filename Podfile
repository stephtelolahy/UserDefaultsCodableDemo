# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'UserDefaultsDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for UserDefaultsDemo

  target 'UserDefaultsDemoTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Cuckoo', '1.0.6'
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "#{target.name}"
    # URITemplate must stay in 4.2 until Cuckoo migrate to Swift 5
    if ['URITemplate'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
end

