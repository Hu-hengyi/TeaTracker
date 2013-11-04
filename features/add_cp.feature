Feature: add a farm with its inputted data

  As an administrator
  So that I can assign drivers and farms collection points to go to
  I want to be able to add new collection points

Scenario: add a new collection point and add its info
  Given I am on the Create New Collection Point page
  When I enter in basic collection point data A
  And I press "create_collection_point"
  Then I should see "Basic Collection Point A"

