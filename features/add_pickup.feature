Feature: add a farm with its inputted data

  As a driver
  So that I can keep a record of the bushels received from each farm
  I want to be able input the weight and name of a tea pickup

Scenario: add a new pickup and its info
  Given I am on the Create New Pickup page
  When I enter in basic pickup data A
  And I press "create_pickup"
  Then I should see "Basic Pickup A"

