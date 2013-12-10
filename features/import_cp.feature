Feature: import a set of cp data

  As an admin
  So that I can enter new cp data en mass into the database
  I want to be able to import new cp or data in a csv format

Background:
  Given I am logged in
  When I initialize farms and cps

@javascript
Scenario: import from csv
  Given I am on the collection points page
  When I upload a file with valid data for cps
  And I import
  Then I should see "North Pickup"
