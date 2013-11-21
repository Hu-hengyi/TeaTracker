Feature: Search the list of payments

  As an administrator
  So that I can better locate relevant payments
  I want to be able to search for specific payments

Scenario: search for a payment by check number
  Given I am logged in
  When I initialize farms, cps, tds, and payments
  Given I am on the payments page
  When I fill in "search_field" with "101"
  And I press "search"
  Then I should see "650"
  Then I should not see "750"

Scenario: search for a payment by time window
  Given I am logged in
  When I initialize farms, cps, tds, and payments
  And I change date of payment with amount "650"
  Given I am on the payments page
  When I fill in "search_time_A" with "01-01-1979"
  When I fill in "search_time_B" with "09-01-1979"
  And I press "search_time"
  Then I should see "650"
  Then I should not see "750"
