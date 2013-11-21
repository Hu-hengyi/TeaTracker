Feature: Search the list of tea deposits

  As an administrator
  So that I can better locate relevant tea deposits
  I want to be able to search for specific tea deposit

Scenario: search for a tea deposit by weight
  Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the Tea Deposit page
  When I fill in "search_field" with "1000"
  And I press "search"
  Then I should see "1000"
  Then I should not see "200"

Scenario: search for a tea deposit by time window
  Given I am logged in
  When I initialize farms, cps, and tea deposits
  And I change date of tea deposit weighing "1000"
  Given I am on the Tea Deposit page
  When I fill in "search_time_A" with "01-01-1979"
  When I fill in "search_time_B" with "09-01-1979"
  And I press "search_time"
  Then I should see "1000"
  Then I should not see "200"
