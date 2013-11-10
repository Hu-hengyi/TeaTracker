Feature: User authentication

  As an administrator
  So that I can view confidential data on the server
  I want to be able to login with my username and password

  Background:
    Given there is an administrator named "JohnDoe"

  # Happy Paths =)
  Scenario: John Doe visits the login page and logs in
    Given I am not logged in
    When I go to the login page
    And I fill in the credentials for "JohnDoe"
    And I press "LOGIN"
    Then I should be on the home page
    And I should not see "LOGIN"

  Scenario: John Doe is already logged in and tries to visit the farms page
    Given I am logged in as "JohnDoe"
    And that there exists a farm named "FooFarm"
    And I go to the farms page
    Then I should see "FooFarm"
    And I should not see "LOGIN"

  Scenario: John doe is logged in and decides to log out
    Given I am logged in as "JohnDoe"
    And I follow "Logout"
    Then I should be on the login page
    And I should not see "LOGIN"

  # Sad Paths =(
  Scenario: John Doe tries to log in, but mistypes his password
    Given I am not logged in
    And I am on the login page
    When I fill in "Email" with "John Doe"
    And I fill in "Password" with "Oops"
    And I press "LOGIN"
    Then I should be on the login page
    And I should see "Invalid email or password."

  Scenario: John Doe tries to log in, but mistypes his username
    Given I am not logged in
    And I am on the login page
    When I fill in "Email" with "Don Joe"
    And I fill in "Password" with "FooBar5"
    And I press "LOGIN"
    Then I should be on the login page
    And I should see "Invalid email or password."

  Scenario: John Doe visits the farm page but is not logged in
    Given I am not logged in
    And there exists a farm named "FooFarm"
    When I go to the farms page
    Then I should see "You need to sign in or sign up before continuing"
    And I should not see "FooFarm"
