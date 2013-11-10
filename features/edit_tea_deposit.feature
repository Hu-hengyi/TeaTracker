Feature: edit a tea deposit's inputted data

  As a driver
  So that I can fix a mistake in my pickup entry
  I want to be able to change a piece of entered data of a tea deposit

Scenario: edit a basic tea deposit
  Given I am logged in
  And I am on the Create New Tea Deposit page
  When I enter in basic tea deposit data A
  And I press "create_tea_deposit"
  And I edit pickup named "Basic Tea Deposit A"
  And I fill in "tea_deposit_name" with "New Tea Deposit A"
  And I press "create_tea_deposit"
  Then I should see "New Tea Deposit A"
