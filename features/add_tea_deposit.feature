Feature: add a tea deposit with its inputted data

  As a driver
  So that I can keep a record of the bushels received from each farm
  I want to be able input the weight and name of a tea deposit

Scenario: add a new tea deposit and its info
  Given Pending Given I am logged in
  And I am on the Create New Tea Deposit page
  When I enter in basic tea deposit data A
  And I press "create_tea_deposit"
  Then I should see "Basic Tea Deposit A"

#there are no sad paths at this time but if after talking with client we find out there are variables which must be required, such as TeaDeposit name, then we'll validate them and add them below
#Scenario: add a new tea deposit and its info
#  Given I am logged in
#  And I am on the Create New Tea Deposit page
#  When I press "create_tea_deposit"
#  Then I should see "Tea Deposits must have a name"

