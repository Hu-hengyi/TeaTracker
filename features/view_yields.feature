Feature: view fertilizer for given farms average weights

  As an admin
  So that I can check the appropriate amount of fertilizer to distribute
  I want to be able to check the fertilizer based on yield of a farm or a weight amount

Background:
  Given I am logged in
  When I initialize farms, cps, and tea deposits

Scenario: view fertilizer on the farms page
  Given I am on the farms page
  Then I should see "20"
  Then I should see "50"

Scenario: view fertilizer from the yield input
  Given I am on the farms page
  When I follow "Calculate Fertilizer"
  When I fill in "yield" with "200"
  And I press "calculate"
  Then I should see "20"
