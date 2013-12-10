Feature: export the list of cps

  As an analyst
  So that I can examine the data in external services
  I want to be able to export the cps in a csv

Background:
  Given I am logged in
  When I initialize farms, cps, and tea deposits

#@javascript
Scenario: export to csv
  Given I am on the collection points page
  When I follow "export_csv"
  Then I should receive a file "attachment"
