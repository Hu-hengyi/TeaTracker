Feature: add a pay group with its inputted data

  As a admin
  So that I can group farms into pay groups
  I want to be able to create pay groups for farms to be added to

Background:
  Given I am logged in

Scenario: add a new pay group and its info
  Given I am on the Create New Pay Group page
  When I enter in basic pay group data A
  And I press "create_pay_group"
  Then I should see "Pay Group A"



