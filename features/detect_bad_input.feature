Feature: Detect possibly erroneous deposits

  As an analyst
  So that I can maintain the integrity of the accounting system
  I want to be able to detect possible input mistakes and resolve them quickly

  Background:
    Given I am logged in
    And a deposit from "10:30:00" that weighs "23" pounds
    And a deposit from "10:30:31" that weighs "22" pounds

  Scenario: User does not add a duplicate.
    Given I am on the deposits page
    When I do nothing
    Then I should not see "Mark Resolved"

  Scenario: User adds a possible duplicate deposit
    Given I am on the deposits page
    When I follow "New Tea Deposit"
    And I fill in "deposit_weight" with "23"
    And I select "10:30:02" as the time from "Weighed at"
    And I press "Create Deposit"
    Then I should be on the deposits page
    And I should see "Mark Resolved"

  Scenario: User adds a non-duplicate deposit
    Given I am on the deposits page
    When I follow "New Tea Deposit"
    And I fill in "deposit_weight" with "23"
    And I select "2:00" as the time from "Weighed at"
    And I press "Create Deposit"
    Then I should be on the deposits page
    And I should not see "Mark Resolved"

  Scenario: User can mark a possible duplicate as resolved
    Given a deposit from "10:30:31" that weighs "22" pounds
    When I am on the deposits page
    And I follow "Mark Resolved"
    Then I should be on the deposits page
    Then I should not see "Mark Resolved"
