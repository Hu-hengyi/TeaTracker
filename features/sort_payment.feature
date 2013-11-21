Feature: sort the list of payments

  As an administrator
  So that I can better review specific payments
  I want to be able to sort payments by some indicator

Scenario: sort payments by time
  Given I am logged in
  When I initialize farms, cps, tds, and payments
  Given I am on the payments page
  And I follow "sort time"
  Then I should see both "750 A" before "650"

Scenario: sort payments by amount
  Given I am logged in
  When I initialize farms, cps, tds, and payments
  Given I am on the payments page
  And I follow "sort amount"
  Then I should see both "650 A" before "750"
