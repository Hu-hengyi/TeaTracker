Feature: add a farm with its inputted data

  As an intern
  So that I can fulfill my data entry tasks
  I want to be able input the gathered data of a farm online

Background:
  Given I am logged in

Scenario: add a new farm and its info
  And I am on the FarmList
  When I follow "create_farm"
  Then I should be on the Create New Farm page
  When I enter in basic farm data A
  And I press "create_farm"
  Then I will see the basic farm

