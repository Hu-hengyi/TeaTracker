
Given(/^I am not logged in$/) do
  visit('/')
  click_link 'Logout' if page.has_link? 'Logout'
end

Given(/^I am logged in$/) do
  step 'I am logged in as an "admin"'
end

Given(/^I am logged in as an "([^"]*)"/) do |type|
  user = create(type)
  steps %{
    Given I am on the login page
    And I fill in "Email" with "#{user.email}"
    And I fill in "Password" with "#{user.password}"
    And I press "LOGIN"
  }
end

Given(/^I am logged in as "([^"]*)"$/) do |name|
  steps %{
    Given I am on the login page
    And I fill in "Email" with "#{name}@lujeri.com"
    And I fill in "Password" with "password"
    And I press "LOGIN"
  }
end

Given (/^(?:that )?there exists a farm named "([^"]*)"$/) do |name|
  Farm.create!(name: name)
end

Given(/^(?:there is )?an administrator named "([^"]*)"$/) do |name|
  create(:admin, name: name,)
end

Given(/^(?:there is )?an analyst named "([^"]*)"$/) do |name|
  create(:analyst, name: name)
end

Given(/^(?:there is )?an intern named "([^"]*)"$/) do |name|
  create(:intern, name: name)
end
When(/^I fill in the credentials for "([^"]*)"$/) do |name|
  steps %{
    When I fill in "Email" with "#{name}@lujeri.com"
    And I fill in "Password" with "password"
  }

end
Given(/^seed data is loaded$/) do
  load "#{Rails.root}/db/seeds.rb"
end
When(/^I follow "([^"]*)" in the row containing "([^"]*)"$/) do |link, arg|
  find(:xpath, "//tr[td[contains(.,'#{arg}')]]/td/a", :text => link).click
end
