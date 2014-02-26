Feature: edit a farm's inputted data

  As an intern
  So that I can fix a mistake in my entry
  I want to be able to change a piece of entered data of a farm


Background:
  Given I am logged in
  When I create basic pay groups

Scenario: edit a basic farm
  Given I am on the Create New Farm page
  When I enter in basic farm data A
  And I press "create_farm"
  And I edit "Basic Farm A"
  And I fill in "farm_name" with "New Farm A"
  And I press "create_farm"
  Then I should see "New Farm A"

#there are no sad paths at this time but if after talking with client we find out there are variables which must be required, such as name, then we'll validate them and add them below
#Scenario: edit a basic farm to have no name
#  Given I am logged in
#  And I am on the Create New Farm page
#  When I enter in basic farm data A
#  And I press "create_farm"
#  And I edit "Basic Farm A"
#  And I fill in "farm_name" with ""
#  And I press "create_farm"
#  Then I should see "Farms must have a name"
