Feature: sort the list of tea deposits

  As an administrator
  So that I can see the percentage of farms that fall into each pay bracket
  I want to be able to see percentages of farms below the tea deposits

Scenario: view bracketed groups
  Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the Tea Deposit page
  Then I should see both "50.00" before "0.00"
