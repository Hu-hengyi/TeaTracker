Feature: Search/Display the list of farms

  As an administrator
  So that I can better locate relevant farms
  I want to be able to search and display farms and their features

Scenario: search for a farm by name
  Given I am logged in
  And I am on the FarmList home page
  When I create basic farms
  When I fill in "search_field" with "Basic Farm A"
  And I press "search"
  Then I should see "Basic Farm A"
  Then I should not see "Basic Farm B"

Scenario: display name, bushes, longitude, latitude
  Given I am logged in
  When I check "display_name"
  And I check "display_bushes"
  And I check "display_longitude"
  And I check "display_latitude"
  And I uncheck "display_notes"
  And I uncheck "display_workers"
  Then I should see "Basic Farm A"
  And I should see "Basic Farm B"
  And I should see "2000"
  And I should not see "Doing pretty well"
