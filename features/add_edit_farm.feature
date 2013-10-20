Feature: add a farm with its inputted data

  As an intern
  So that I can fulfill my data entry tasks
  I want to be able the gathered data of a farm online

Scenario: add a new farm and its info
  Given I am on the FarmList home page
  When I follow "Add new farm"
  Then I should be on the Create New Farm page
  When I enter in basic farm data
  And I press "Create farm"
  Then I will see the basic farm

