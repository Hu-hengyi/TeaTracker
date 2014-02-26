Feature: edit a pay group's inputted data

  As an admin
  So that I can change the name or notes on a pay group
  I want to be able to edit that pay group


Background:
  Given I am logged in

Scenario: edit a basic pay group
  Given I am on the Create New Pay Group page
  When I enter in basic pay group data A
  And I press "create_pay_group"
  And I edit the pay group named "Pay Group A"
  And I fill in "Name" with "Primary Group A"
  And I press "create_pay_group"
  Then I should see "Primary Group A"

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
