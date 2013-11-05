Feature: add a farm with its inputted data

  As an administrator
  So that I can alter the location or name of a collection point
  I want to be able to change a piece of entered data of a collection point

Scenario: edit a basic farm
  Given I am logged in
  And I am on the Create New Collection Point page
  When I enter in basic collection point data A
  And I press "create_collection_point"
  And I edit pickup named "Basic Collection Point A"
  And I fill in "pickup_name" with "New Collection Point A"
  And I press "create_collection_point"
  Then I should see "New Collection Point A"
