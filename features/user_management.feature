Feature: User management

  As an administrator
  So that I can ensure that trusted, and only trusted, people have access to the site
  I want to be able to be able to add, remove, and update user accounts and access priviledges

  Background:
    Given there is an administrator named "John Doe"
    And there is an intern named "Ian Turn"
    And there is an intern named "Ivan Agruduate"

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