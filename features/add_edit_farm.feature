Feature: add a farm with its inputted data

  As an intern
  So that I can fulfill my data entry tasks
  I want to be able the gathered data of a farm online

Scenario: add a new farm and its info
  Given I am on the farm list page
  When I click "Add new farm"
  Then I should be on the Create New Farm page
  When I enter in basic farm data
  And I click "Create farm"
  Then I should see basic farm
  
