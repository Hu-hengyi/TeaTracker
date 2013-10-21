Feature: add a farm with its inputted data

  As an intern
  So that I can fix a mistake in my entry
  I want to be able to change a piece of entered data of a farm

Scenario: edit a basic farm
  Given I am on the Create New Farm page
  When I enter in basic farm data A
  And I press "create_farm"
  And I follow "edit Basic Farm A"
  And I fill in "farm_name" with "New Farm A"
  And I press "update_farm"
  Then I should see "New Farm A"
