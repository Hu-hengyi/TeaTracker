pass = 'aabbccddeeff'

Given(/^I am not logged in$/) do
  steps %{
    Given I am on the home page
    And I follow "logout"
  }
end

Given(/^I am logged in$/) do
  step 'Given I am logged in as an "admin"'
end

Given(/^I am logged in as an "([^"]*)"/) do |type|
  testEmail = 'testuser@lujeri.com'
  testPass = 'testpassword'

  user = User.create!(email: testEmail, password: testPass, password_confirmation: testPass)
  user.user_type = UserType.find_by_name'type'
  user.save!
  steps %{
    Given I am on the login page
    And I fill in "Email" with "#{testEmail}"
    And I fill in "Password" with "#{testPass}"
    And I press "Sign in"
  }
end

Given(/^I am logged in as "([^"]*)"$/) do |name|
  steps %{
    Given I am on the login page
    And I fill in "Email" with "#{name}@lujeri.com"
    And I fill in "Password" with "#{pass}"
    And I press "Sign in"
  }
end

Given (/^(?:that )?there exists a farm named "([^"]*)"$/) do |name|
  Farm.create!(name: name)
end

Given(/^there is an administrator named "([^"]*)"$/) do |name|
  admin = User.create!(email: name + "@lujeri.com", password: pass, password_confirmation: pass)
  admin.user_type = UserType.find_by_name('admin')
end

Given(/^there is an analyst named "([^"]*)"$/) do |name|
  analyst = User.create!(email: name + "@lujeri.com", password: pass, password_confirmation: pass)
  analyst.user_type = UserType.find_by_name('analyst')
end

Given(/^there is an intern named "([^"]*)"$/) do |name|
  intern = User.create!(email: name + "@lujeri.com", password: pass, password_confirmation: pass)
  intern.user_type = UserType.find_by_name('intern')
end
When(/^I fill in the credentials for "([^"]*)"$/) do |name|
  steps %{
    When I fill in "Email" with "#{name}@lujeri.com"
    And I fill in "Password" with "#{pass}"
  }

end