Feature: sort the list of farms

  As an administrator
  So that I can better find and evaluate farms
  I want to be able to sort farms by some indicator

Scenario: sort farms by name
  Given I am logged in
  And I am on the FarmList
  When I create basic farms
  And I follow "sort Bushes"
  And I follow "sort Name"
  Then I should see both "Basic Farm A" before "Basic Farm B"
