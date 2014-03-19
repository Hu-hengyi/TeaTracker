Feature: filter the list of tea deposits

  As an administrator
  So that I can better find categories of deposits
  I want to be able to filter tea deposits by pay group or time

Background:
  Given I am logged in
  When I initialize farms, cps, and tea deposits

Scenario: no filter
  Given I am on the Tea Deposit page
  Then I should see "Very Good"
  And I should see "Bad"

Scenario: filter tds by pay group B
  Given I am on the Tea Deposit page
  And I fill in "pay_group_filter" with "Pay Group A"
  And I press "filters_submit"
  Then I should see "Very Good"
  And I should see "Bad"

Scenario: filter tds by pay group A
  Given I am on the Tea Deposit page
  And I fill in "pay_group_filter" with "Pay Group B"
  And I press "filters_submit"
  Then I should not see "Very Good"
  And I should not see "Bad"

Scenario: filter tds by time
  Given I am on the Tea Deposit page
  And I select "2009" from "deposit_f_weighed_from_1i"
  And I select "January" from "deposit_f_weighed_from_2i"
  And I select "1" from "deposit_f_weighed_from_3i"
  And I select "2009" from "deposit_t_weighed_to_1i"
  And I select "December" from "deposit_t_weighed_to_2i"
  And I select "1" from "deposit_t_weighed_to_3i"
  And I press "filters_submit"
  Then I should see "Very Good"
  And I should not see "Bad"
