Feature: filter the list of farms

  As an administrator
  So that I can better find categories of farms
  I want to be able to filter farms by pay group

Background:
  Given I am logged in
  When I initialize farms, cps, and tea deposits

Scenario: no filter
  Given I am on the FarmList
  Then I should see "Basic Farm A"
  And I should see "Basic Farm B"

Scenario: filter tds by pay group B
  Given I am on the FarmList
  And I fill in "pay_group_filter" with "Pay Group A"
  And I press "filters_submit"
  Then I should see "Basic Farm A"
  And I should see "Basic Farm B"

Scenario: filter tds by pay group A
  Given I am on the FarmList
  And I fill in "pay_group_filter" with "Pay Group B"
  And I press "filters_submit"
  Then I should not see "Basic Farm A"
  And I should not see "Basic Farm B"
