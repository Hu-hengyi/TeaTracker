pass = 'aabbccddeeff'

Given(/^I am not logged in$/) do
  visit('/')
  click_link 'Logout' if page.has_link? 'Logout'
end

Given(/^I am logged in$/) do
  step 'I am logged in as an "admin"'
end

Given(/^I am logged in as an "([^"]*)"/) do |type|
  testEmail = 'testuser@lujeri.com'
  testPass = 'testpassword'
  testName = 'test#{type}'

  user = User.create!(name: testName, email: testEmail, password: testPass, password_confirmation: testPass)
  user.user_type = UserType.find_by_name'type'
  user.save!
  steps %{
    Given I am on the login page
    And I fill in "Email" with "#{testEmail}"
    And I fill in "Password" with "#{testPass}"
    And I press "LOGIN"
  }
end

Given(/^I am logged in as "([^"]*)"$/) do |name|
  steps %{
    Given I am on the login page
    And I fill in "Email" with "#{name}@lujeri.com"
    And I fill in "Password" with "#{pass}"
    And I press "LOGIN"
  }
end

Given (/^(?:that )?there exists a farm named "([^"]*)"$/) do |name|
  Farm.create!(name: name)
end

Given(/^there is an administrator named "([^"]*)"$/) do |name|
  admin = User.create!(name: name, email: name + "@lujeri.com", password: pass, password_confirmation: pass)
  admin.user_type = UserType.find_by_name('admin')
  admin.save!
end

Given(/^there is an analyst named "([^"]*)"$/) do |name|
  analyst = User.create!(name: name, email: name + "@lujeri.com", password: pass, password_confirmation: pass)
  analyst.user_type = UserType.find_by_name('analyst')
  analyst.save!
end

Given(/^there is an intern named "([^"]*)"$/) do |name|
  intern = User.create!(name: name, email: name + "@lujeri.com", password: pass, password_confirmation: pass)
  intern.user_type = UserType.find_by_name('intern')
  intern.save!
end
When(/^I fill in the credentials for "([^"]*)"$/) do |name|
  steps %{
    When I fill in "Email" with "#{name}@lujeri.com"
    And I fill in "Password" with "#{pass}"
  }

end
Given(/^seed data is loaded$/) do
  load "#{Rails.root}/db/seeds.rb"
end
When(/^I follow "([^"]*)" in the row containing "([^"]*)"$/) do |link, arg|
  find(:xpath, "//tr[td[contains(.,'#{arg}')]]/td/a", :text => link).click
end
