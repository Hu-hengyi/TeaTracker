Feature: sort the list of collection points

  As an administrator
  So that I can better find and evaluate collection points
  I want to be able to sort collection points by some indicator

Scenario: sort cps by name
  Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the collection points page
  And I follow "sort Name"
  Then I should see both "Basic Collection Point A" before "Basic Collection Point B"
