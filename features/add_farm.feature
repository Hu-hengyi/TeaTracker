Feature: add a farm with its inputted data

  As an intern
  So that I can fulfill my data entry tasks
  I want to be able input the gathered data of a farm online

Background:
  Given I am logged in
  When I create basic pay groups


Scenario: add a new farm and its info
  And I am on the FarmList
  When I follow "create_farm"
  Then I should be on the Create New Farm page
  When I enter in basic farm data A
  And I press "create_farm"
  Then I will see the basic farm

#there are no sad paths at this time but if after talking with client we find out there are variables which must be required, such as farm name, then we'll validate them and add them below
#Scenario: add a new farm without a name
#  And I am on the FarmList
#  When I follow "create_farm"
#  Then I should be on the Create New Farm page
#  When I press "create_farm"
#  Then I should see "Farms must have a name"

