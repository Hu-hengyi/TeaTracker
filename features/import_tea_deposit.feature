Feature: import a set of tea deposit data

  As an admin
  So that I can enter new tea deposit data en mass into the database
  I want to be able to import new tea deposits or data in a csv format

Background:
  Given I am logged in
  When I initialize farms and cps

@javascript
Scenario: import from csv
  Given I am on the Tea Deposit page
  When I upload a file with valid data for tea deposits
  And I import
  Then I should see "40.23"
