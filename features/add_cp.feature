Feature: add a cp with its inputted data

  As an administrator
  So that I can assign drivers and farms collection points to go to
  I want to be able to add new collection points

Scenario: add a new collection point and add its info
  Given I am logged in
  And I am on the Create New Collection Point page
  When I enter in basic collection point data A
  And I press "create_collection_point"
  Then I should see "Basic Collection Point A"

#there are no sad paths as missing any of the fields is still an acceptable cp entry, if after discussing with the client we discover that certain fields should be mandatory, we'll add them below.
#Scenario: add a new cp without a name
#  Given I am logged in
#  And I am on the Create New Collection Point page
#  When I press "create_collection_point"
#  Then I should see "Collection Points must have a name"

