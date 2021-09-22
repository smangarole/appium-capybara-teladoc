require 'appium_capybara'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'site_prism'

Capybara.server_host = '0.0.0.0'
Capybara.server_port = 4723
Capybara.default_max_wait_time = 30

appium_ios_opts = { appium_lib: {}, caps: {} }
appium_ios_opts[:appium_lib][:server_url] = 'your Browserstack URL'
appium_ios_opts[:appium_lib][:debug] = true
appium_ios_opts[:caps][:platformName] = ENV['PLATFORM_NAME'] || 'iOS'
appium_ios_opts[:caps][:platformVersion] = ENV['PLATFORM_VERSION'] || ''
appium_ios_opts[:caps][:deviceName] = ENV['DEVICE_NAME'] || ''
appium_ios_opts[:caps][:app] = 'bs://appHashId'
appium_ios_opts[:caps][:automationName] = 'XCUITest'
appium_ios_opts[:caps][:build] = 'Teladoc App Test'
appium_ios_opts[:caps][:acceptSslCert] = 'true'
appium_ios_opts[:caps][:processArguments] = "{\"args\": [],\"env\": {\"TESTING\":\"YES\"}}"
appium_ios_opts[:caps]['browserstack.appium_version'] = '1.20.2'

Capybara.register_driver(:ios) { |app| Appium::Capybara::Driver.new(app, appium_ios_opts) }

def select_driver
  Capybara.default_driver = :ios
end
