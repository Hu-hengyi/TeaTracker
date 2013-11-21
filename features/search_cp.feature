Feature: Search the list of collection points

  As an administrator
  So that I can better locate relevant collection points
  I want to be able to search for specific collection points

Scenario: search for a collection point by name
  Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the collection points page
  When I fill in "search_field" with "Basic Collection Point A"
  And I press "search"
  Then I should see "Basic Collection Point A"
  Then I should not see "Basic Collection Point B"

