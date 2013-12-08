Feature: view fertilizer for given farms average weights

  As an admin
  So that I can check the appropriate amount of fertilizer to distribute
  I want to be able to check the fertilizer based on yield of a farm or a weight amount

Background:
  Given I am logged in
  When I initialize farms, cps, and tea deposits

Scenario: view fertilizer on the farms page
  Given I am on the farms page
  Then I should see "30"
  Then I should see "1800"
