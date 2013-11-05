require "selenium-webdriver"


When /I enter in basic farm data A/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Farm A     |
    | Bushes    | 2000             |
    | Workers   | 8                |
    | Longitude | 35.628262        |
    | Latitude  | -15.928978       |
    | Notes     | Doing great work |
  })
end

When /I enter in basic farm data B/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Farm B      |
    | Bushes    | 1000              |
    | Workers   | 5                 |
    | Longitude | 35.628260         |
    | Latitude  | -15.928970        |
    | Notes     | Doing pretty well |
  })
end

When /^I create basic farms$/ do
  visit farms_path
#  step 'Given I am on the home page'
  When 'I follow "create_farm"'
  And 'I enter in basic farm data A'
  And 'I press "create_farm"'
  visit farms_path
  And 'I follow "create_farm"'
  And 'I enter in basic farm data B'
  And 'I press "create_farm"'
  visit farms_path
end

Then /I will see the basic farm/ do
  Then 'I should see "Basic Farm A"'
end

# Removed due to redundancy
#Then /I should see "(.*)"/ do |item|
#  myPage = page.body.to_s
#  assert myPage.index(item.to_s) != nil
#end

Then /I should see both "(.*)" before "(.*)"/ do |e1, e2|
  myPage = page.body.to_s
  assert myPage.index(e1.to_s) < myPage.index(e2.to_s)
end

Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
  page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
end

=begin
Then /^I should receive a file "(.*)"/ do |file|
  assert result = page.response_headers['Content-Type'] == "application/octet-stream"
  if result
    assert result = page.response_headers['Content-Disposition'] =~ /#{file}/
  end
  result
end
=end

When /^I confirm the dialog box/ do
  driver = Selenium::WebDriver.for :firefox
  driver.navigate.to "http://0.0.0.0:3000/farms.csv"
  driver.find_element(:name, 'element_with_alert_javascript').click
  a = driver.switch_to.alert
  a.accept
#  if a.text == 'A value you are looking for'
#    a.dismiss
#  else
#    a.accept
#  end
#  page.driver.browser.switch_to.alert.accept
end

When /^I edit "(.*)"$/ do |name|
  visit edit_farm_path(Farm.find_by_name(name))
end
