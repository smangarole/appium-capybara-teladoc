require 'selenium-webdriver'

def wait_for
  Selenium::WebDriver::Wait.new(:timeout => 15).until { yield }
end

Given(/^I open the app$/) do
$driver = Capybara.current_session.driver.appium_driver
$driver.manage.timeouts.implicit_wait = 30
Capybara.default_max_wait_time = 30

wait_for { $driver.find_element(:accessibility_id, "SWITCH SERVER BUTTON").displayed? }
$driver.find_elements(:accessibility_id, "SWITCH SERVER BUTTON").first.click

wait_for { $driver.find_element(:accessibility_id, "_FormTextField_environment").displayed? }
$driver.find_elements(:accessibility_id, "_FormTextField_environment").first.click

0...20.times do |i|
  element = $driver.find_elements(:xpath, "//XCUIElementTypePickerWheel")[0] rescue nil
  break if  element.text == "Other"
  $driver.execute_script("mobile:selectPickerWheelValue", { "order" => "next", "element" => element, "offset" => 0.15 }) rescue nil
end

$driver.find_element(:accessibility_id, "Done").click
$driver.find_element(:accessibility_id, "_FormTextField_other_server").clear
$driver.find_element(:accessibility_id, "_FormTextField_other_server").send_keys("https://mobile-api.replatforming-automation.qa.teladoc.io/")
$driver.find_elements(:accessibility_id, "Done").first.click
$driver.find_elements(:accessibility_id, "_CallToActionButton_submitButton|SWITCH SERVER").first.click
$driver.find_element(:accessibility_id, "_FormTextField_username").clear

end

When(/^I login$/) do
$driver.find_element(:accessibility_id, "_FormTextField_username").send_keys("member-all1")
$driver.find_element(:accessibility_id, "_FormTextField_password").clear
$driver.find_element(:accessibility_id, "_FormTextField_password").send_keys("test123456")
$driver.find_elements(:accessibility_id, "_CallToActionButton_nextButton|LOG IN").first.click  
end

Then(/^the mental health page is displayed$/) do
puts $driver.get_source
text = "I\\'ll skip this step"
wait_for { $driver.find_exact(text).displayed? }
$driver.find_exact(text).click 

# 2 Clicks Required here for 2 diff screens
text = "Not Now"
2.times do |i|
  $driver.find_exact(text).click
end

text = "Mental Health"
$driver.find_exact(text).click

end
