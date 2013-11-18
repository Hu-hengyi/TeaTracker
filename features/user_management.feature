Feature: User management

  As an administrator
  So that I can ensure that trusted, and only trusted, people have access to the site
  I want to be able to be able to add, remove, and update user accounts and access priviledges

  Background:
    Given there is an administrator named "JohnDoe"
    And there is an intern named "Ian Turn"
    And there is an intern named "Ivan Agruduate"

#Happy Paths =)
  Scenario: John Doe wants to review the list of interns
    Given I am logged in as an "admin"
    And I am on the user management page
    Then I should see "Ian Turn"
    And I should see "Ivan Agruduate"

  Scenario: John Doe adds a new intern to the database
    Given I am logged in as "JohnDoe"
    And I am on the user management page
    And follow "New User"
    And fill in "Name" with "Ivan Turn"
    And I fill in "Email" with "intrn@lujeri.com"
    And fill in "Password" with "n3W p@s$W0rD"
    And select "Intern" from "User Type"
    And show me the page
    And press "Register User"
    When I am on the user management page
    Then I should see "Intern"
    And I should see "intrn@lujeri.com"
    And I should not see "n3W p@s$W0rD"

  Scenario: John Doe adds a new administrator to the database
    Given I am logged in as "JohnDoe"
    And I am on the user management page
    When follow "New User"
    And select "Admin" from "User Type"
    And fill in "Name" with "admnstrtr"
    And fill in "Email" with "thebossman@lujeri.com"
    And fill in "Password" with "administastic"
    And press "Register User"
    And I am on the user management page
    And I should see "Admin"
    And I should see "admnstrtr"
    And I should see "thebossman@lujeri.com"
    And I should not see "administastic"

  Scenario: John Doe changes a user's privileges
    Given I am logged in as "JohnDoe"
    And I am on the edit user page for "Ian Turn"
    And I select "Admin" from "User Type"
    And I press "Save Changes"
    Then I should be on the show user page for "Ian Turn"
    And I should see "User was successfully updated"
    And I should see "Admin"

  Scenario: John Doe deletes a user from the database
    Given I am logged in as "JohnDoe"
    And I am on the user management page
    And I follow "Remove User" in the row containing "Ian Turn"
    Then I should be on the user management page
    And I should not see "Ian Turn"

# Sad Paths =(
  Scenario: John Doe wants to create a new user, but doesn't submit all of \
  the necessary data.
    Given I am logged in as "JohnDoe"
    And am on the new user page
    When fill in "Name" with "A name"
    And leave the "Email" field blank
    And press "Create User"
    Then I should see "Email can't be blank"

  Scenario: John Doe wants to edit an existing user, but doesn't submit all of \
  the necessary data.
    Given I am logged in as "JohnDoe"
    When am on the edit user page for "Ian Turn"
    And fill in "Name" with "At least he has a name..."
    And leave the "Email" field blank
    And press "Save Changes"
    And I should see "Email can't be blank"

  Scenario: Someone tries to view an admin page without being logged in at all
    Given I am not logged in
    When I go to the user management page
    Then I should be on the login page

  Scenario: Admin tries to give a user an invalid email address
    Given I am logged in as an "admin"
    When I go to the edit user page for "Ian Turn"
    And I fill in "Email Address" with "foo"
    And I press "Save Changes"
    Then I should see "Email is invalid"
