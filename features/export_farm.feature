Feature: export the list of farms

  As an analyst
  So that I can examine the data in external services
  I want to be able to export the farms in a csv

#@javascript
Scenario: export to csv
  Given I am on the FarmList home page
  When I follow "export_csv"
#  When I confirm the dialog box
#  Then I should get a download with the filename "farms.csv"
