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

  Scenario: Unconfirmed user requests password setup email again
    Given an unconfirmed user with email address "newuser@lujeri.com"
    And I am on the request confirmation page
    When I fill in "Email" with "newuser@lujeri.com"
    And I press "Resend confirmation instructions"
    Then I should be on the login page
    And I should see "You will receive an email with instructions about how to confirm your account in a few minutes"

  Scenario: User responds to email to set his password
    Given an unconfirmed user with email address "newuser@lujeri.com"
    And I am on the confirmation email link for "newuser@lujeri.com"
    When I fill in "Password" with "drowssap"
    And I fill in "Password confirmation" with "drowssap"
    And I press "Confirm Account"
    Then I should be on the home page
    And the user with email address "newuser@lujeri.com" should be confirmed



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

  Scenario: An intern tries to view an admin page without the proper credentials
    Given I am logged in as an "intern"
    When I go to the user management page
    Then I should see "This area is restricted to users with administrator privileges"

  Scenario: Forgot password
    Given seed data is loaded
    Given I am not logged in
    When I go to the login page
    When I follow "Forgot your password"
    When I fill in "user_email" with "admin@lujeri.com"
    When I press "Reset Password"
    Then I should see "You will receive an email with instructions"

  Scenario: Forgot password and incorrectly typed
    Given I am not logged in
    When I go to the login page
    When I follow "Forgot your password"
    When I fill in "user_email" with "test@fake.com"
    When I press "Reset Password"
    Then I should see "Email not found"

  Scenario: No confirmation
    Given seed data is loaded
    Given I am not logged in
    When I go to the login page
    When I follow "receive confirmation instructions"
    When I fill in "user_email" with "admin@lujeri.com"
    When I press "Resend confirmation instructions"
    Then I should see "Email was already confirmed"

  Scenario: No confirmation and incorrectly typed
    Given I am not logged in
    When I go to the login page
    When I follow "receive confirmation instructions"
    When I fill in "user_email" with "test@fake.com"
    When I press "Resend confirmation instructions"
    Then I should see "Email not found"

  Scenario: Confirmed user requests confirmation
    Given I am on the request confirmation page
    When I fill in the email address for "JohnDoe"
    And I press "Resend confirmation instructions"
    Then I should see "Email was already confirmed"

  Scenario: User request confirmation for nonexistant user
    Given I am on the request confirmation page
    When I fill in "Email" with "not@real.com"
    And I press "Resend confirmation instructions"
    Then I should see "Email not found"

  Scenario: User responds to email to set his password, but confirmation password doesn't match
    Given an unconfirmed user with email address "newuser@lujeri.com"
    And I am on the confirmation email link for "newuser@lujeri.com"
    When I fill in "Password" with "password"
    And I fill in "Password confirmation" with "drowssap"
    And I press "Confirm Account"
    Then I should see "Password confirmation does not match password"
    And the user with email address "newuser@lujeri.com" should be not confirmed

