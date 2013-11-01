Feature: User authentication

  As an administrator
  So that I can view confidential data on the server
  I want to be able to login with my username and password

  Background:
    Given there exists a user "JohnDoe" with password "FooBar5"

  # Happy Paths =)
  Scenario: John Doe visits the login page and logs in
    Given I am not logged in
    And I go to the login page
    And I fill in "User Name" with "John Doe"
    And I fill in "Password" with "FooBar5"
    And I press "Log in"
    Then I should be on the home page
    And I should not see "Please Log In"

  Scenario: John Doe is already logged in and tries to visit the farms page
    Given I am logged in as "JohnDoe"
    And that there exists a farm named "FooFarm"
    And I go to the farms page
    Then I should see "FooFarm"
    And I should not see "Please Log In"

  Scenario: John doe is logged in and decides to log out
    Given I am logged in as "JohnDoe"
    And I follow "Log Out"
    Then I should be on the login page
    And I should not see "JohnDoe"

  # Sad Paths =(
  Scenario: John Doe tries to log in, but mistypes his password
    Given I am on the login page
    And I fill in "User Name" with "John Doe"
    And I fill in "Password" with "Oops"
    And I press "Log in"
    Then I should be on the login page
    And I should see "Incorrect user name or password"

  Scenario: John Doe tries to log in, but mistypes his username
    Given I am on the login page
    And I fill in "User Name" with "Don Joe"
    And I fill in "Password" with "FooBar5"
    And I press "Log in"
    Then I should be on the login page
    And I should see "Incorrect user name or password"

  Scenario: John Doe visits the farm page but is not logged in
    Given I am not logged in
    And I go to the farms page
    And there exists a farm named "FooFarm"
    Then I should see "Please Log In"
    And I should not see "FooFarm"

  Feature: Modifying user data

  As an administrator
  So that I can ensure that trusted, and only trusted, people have access to the site
  I want to be able to be able to add, remove, and update user accounts and access priviledges

  Background:
    Given there is an administrator named "John Doe" whose password is "FooBar5"
    And there is an intern named "Ian Turn" whose password is "student"
    And there is an intern named "Ivan Agruduate" whose password is "lemmeOutaHere"

  # Happy Paths =)
  Scenario: John Doe wants to review the list of interns
    Given I am logged in as "John Doe"
    And I am on the list users page
    Then I should see "Ian Turn"
    And I should see "Ivan Agruduate"

  Scenario: John Doe adds a new intern to the database
    Given I am logged in as "John Doe"
    And I am on the user management page
    And follow "New User"
    And select "Intern" from "User Type"
    And fill in "User Name" with "intrn"
    And fill in "Password" with "n3W p@s$W0rD"
    And press "Create User"
    Then I should be on a show user page
    And I should see "Intern"
    And I should see "intrn"
    And I should not see "n3W p@s$W0rD"

  Scenario: John Doe adds a new administrator to the database
    Given I am logged in as "John Doe"
    And I am on the user management page
    And follow "New User"
    And select "Administrator" from "User Type"
    And fill in "User Name" with "admnstrtr"
    And fill in "Password" with "administastic"
    And press "Create User"
    Then I should be on a show user page
    And I should see "Administrator"
    And I should see "admnstrtr"
    And I should not see "administastic"

  Scenario: John Doe changes a user's privileges
    Given I am logged in as "John Doe"
    And I am on edit user page for "Ian Turn"
    And I select "administrator" from "User Type"
    And I press "Save"
    Then I should be on the show user page for "Ian Turn"
    And I should see "Administrator"

  Scenario: John Doe deletes a user from the database
    Given I am logged in as "John Doe"
    And I am on the edit user page for "Ian Turn"
    And I press "Delete User"
    Then I should be on the list users page
    And I should not see "Ian Turn"

  # Sad Paths =(
  Scenario: John Doe wants to create a new user, but doesn't submit all of \
            the necessary data.
    Given I am logged in as "John Doe"
    And am on create new user page
    And fill in "User Name" with "At least he has a name..."
    And leave the "Password" field blank
    And press "Save"
    Then I should be on the create user page
    And I should see "Could not save user"
    And I should see "Password cannot be blank"

  Scenario: John Doe wants to edit an existing user, but doesn't submit all of \
            the necessary data.
    Given I am logged in as "John Doe"
    And am on edit user page for "Ian Turn"
    And fill in "User Name" with "At least he has a name..."
    And leave the "Password" field blank
    And press "Save"
    Then I should be on the edit user page
    And I should see "Could not update user"
    And I should see "Password cannot be blank"