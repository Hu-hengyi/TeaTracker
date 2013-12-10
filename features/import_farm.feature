Feature: import a set of data

  As an analyst
  So that I can enter legacy data en mass into the database
  I want to be able to import new farms or data in a csv format

Background:
  Given I am logged in
  When I initialize farms and cps

@javascript
Scenario: import from csv
  Given I am on the FarmList
  When I upload a file with valid data for farms
  And I import
  Then I should see "Import Farm A"
