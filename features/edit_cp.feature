Feature: edit a cp's inputted data

  As an administrator
  So that I can alter the location or name of a collection point
  I want to be able to change a piece of entered data of a collection point

Scenario: edit a basic cp
  Given I am logged in
  And I am on the Create New Collection Point page
  When I enter in basic collection point data A
  And I press "create_cp"
  And I edit the collection point named "Basic Collection Point A"
  And I fill in "cp_name" with "New Collection Point A"
  And I press "create_cp"
  Then I should see "New Collection Point A"

#there are no sad paths at this time but if after talking with client we find out there are variables which must be required, such as name, then we'll validate them and add them below
#Scenario: edit a basic cp to having no name
#  Given I am logged in
#  And I am on the Create New Collection Point page
#  When I enter in basic collection point data A
#  And I press "create_cp"
#  And I edit the collection point named "Basic Collection Point A"
#  And I fill in "cp_name" with ""
#  And I press "create_collection_point"
#  Then I should see "Collection Points must have a name"


