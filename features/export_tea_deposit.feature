Feature: export the list of tea deposits

  As an analyst
  So that I can examine the data in external services
  I want to be able to export the tea deposits in a csv

Background:
  Given I am logged in
  When I initialize farms, cps, and tea deposits

#@javascript
Scenario: export to csv
  Given I am on the Tea Deposit page
  When I follow "export_csv"
  Then I should receive a file "attachment"
#  When I confirm the dialog box
#  Then I should get a download with the filename "farms.csv"
