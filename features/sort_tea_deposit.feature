Feature: sort the list of tea deposits

  As an administrator
  So that I can better find and pay for tea deposits
  I want to be able to sort tea deposits by some indicator

Scenario: sort tds by cp
  Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the Tea Deposits page
  And I follow "sort Cp"
  Then I should see both "Basic Collection Point A" before "Basic Collection Point B"

Scenario: sort tds by weight
  Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the Tea Deposits page
  And I follow "sort Weight"
  Then I should see both "Basic Tea Deposit B" before "Basic Tea Deposit A"
