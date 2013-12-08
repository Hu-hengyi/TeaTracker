Feature: edit a tea deposit's inputted data

  As a driver
  So that I can fix a mistake in my pickup entry
  I want to be able to change a piece of entered data of a tea deposit


Background:
  Given I am logged in
  When I initialize farms and cps


Scenario: edit a basic tea deposit
  Given I am on the Create New Tea Deposit page
  When I enter in basic tea deposit data A
  And I press "create_deposit"
  And I edit the tea deposit weighing "1000"
  And I select "OK" from "deposit_quality"
  And I press "create_deposit"
  Then I should see "OK"

#there are no sad paths at this time but if after talking with client we find out there are variables which must be required, such as name, then we'll validate them and add them below
#Scenario: edit a basic tea deposit with no name
#  Given I am logged in
#  And I am on the Create New Tea Deposit page
#  When I enter in basic tea deposit data A
#  And I press "create_tea_deposit"
#  And I edit pickup named "Basic Tea Deposit A"
#  And I fill in "tea_deposit_name" with ""
#  And I press "create_tea_deposit"
#  Then I should see "Tea Deposits must have a name"
