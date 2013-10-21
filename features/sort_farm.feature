Feature: sort the list of farms

  As an administrator
  So that I can better find and evaluate farms
  I want to be able to sort farms by some indicator

Scenario: sort farms by name
  Given I am on the FarmList home page
  When I create basic farms
  And I follow "sort Name"
  Then I should see "Basic Farm A" before "Basic Farm B"
