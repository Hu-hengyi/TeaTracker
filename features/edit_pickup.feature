Feature: add a farm with its inputted data

  As a driver
  So that I can fix a mistake in my pickup entry
  I want to be able to change a piece of entered data of a pickup

Scenario: edit a basic farm
  Given I am logged in
  And I am on the Create New Pickup page
  When I enter in basic pickup data A
  And I press "create_pickup"
  And I edit pickup named "Basic Pickup A"
  And I fill in "pickup_name" with "New Pickup A"
  And I press "create_pickup"
  Then I should see "New Pickup A"
