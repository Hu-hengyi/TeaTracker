Feature: add a farm with its inputted data

  As an intern
  So that I can fulfill my data entry tasks
  I want to be able input the gathered data of a farm online

Scenario: add a new farm and its info
  Given I am on the FarmList home page
  When I follow "create_farm"
  Then I should be on the Create New Farm page
  When I enter in basic farm data
  And I press "create_farm"
  Then I will see the basic farm

