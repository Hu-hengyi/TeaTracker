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
  And I import the csv
  Then I should see "345"
#  When I press "browse"
#  When I upload a file
#  When I confirm the dialog box
#  When I press "import_farms"
#  Then I should see "Test Farm CSV"

@javascript
Scenario: import suspicious data from csv
  Given I am on the Tea Deposit page
  When I upload a file with suspicious data for tea deposits
  And I import the csv
  Then I should see "The following activity requires confirmation:"

