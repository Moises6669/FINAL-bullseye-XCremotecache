# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

plugin 'cocoapods-xcremotecache'
xcremotecache({
  'cache_addresses' => ['http://162.255.21.50:8080/cache'], 
  'primary_repo' => 'https://github.com/Moises6669/FINAL-bullseye-XCremotecache.git',
  'mode' => 'consumer',
  'final_target' => 'BullsEye',
  'primary_branch' => 'main'
})

target 'BullsEye' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'FirebaseCore'
  pod 'BCryptSwift'
  pod 'TestFairy'
  # Pods for BullsEye

  target 'BullsEyeSlowTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BullsEyeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BullsEyeUITests' do
    # Pods for testing
  end

end
