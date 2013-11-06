Feature: User management

  As an administrator
  So that I can ensure that trusted, and only trusted, people have access to the site
  I want to be able to be able to add, remove, and update user accounts and access priviledges

  Background:
    Given seed data is loaded
    And there is an administrator named "JohnDoe"
    And there is an intern named "IanTurn"
    And there is an intern named "IvanAgruduate"

# Happy Paths =)
  Scenario: John Doe wants to review the list of interns
    Given I am logged in as "JohnDoe"
    And I am on the user management page
    Then I should see "IanTurn"
    And I should see "IvanAgruduate"

  Scenario: John Doe adds a new intern to the database
    Given I am logged in as "JohnDoe"
    And I am on the user management page
    And follow "New User"
    And fill in "Name" with "Ivan Turn"
    And I fill in "Email" with "intrn@lujeri.com"
    And fill in "Password" with "n3W p@s$W0rD"
    And select "Intern" from "User Type"
    And press "Create User"
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
    And press "Create User"
    And I am on the user management page
    And I should see "Admin"
    And I should see "admnstrtr"
    And I should see "thebossman@lujeri.com"
    And I should not see "administastic"

  Scenario: John Doe changes a user's privileges
    Given I am logged in as "JohnDoe"
    And I am on the edit user page for "IanTurn"
    And I select "Admin" from "User Type"
    And I press "Save Changes"
    Then I should be on the show user page for "IanTurn"
    And I should see "Admin"

  Scenario: John Doe deletes a user from the database
    Given I am logged in as "JohnDoe"
    And I am on the user management page
    And I follow "Remove User" in the row containing "IanTurn"
    Then I should be on the user management page
    And I should not see "IanTurn"

# Sad Paths =(
  Scenario: John Doe wants to create a new user, but doesn't submit all of \
  the necessary data.
    Given I am logged in as "JohnDoe"
    And am on the new user page
    When fill in "Name" with "A name"
    And fill in "Email" with "me@myself.com"
    And leave the "Password" field blank
    And press "Create User"
    Then I should see "Password can't be blank"

  Scenario: John Doe wants to edit an existing user, but doesn't submit all of \
  the necessary data.
    Given I am logged in as "JohnDoe"
    When am on the edit user page for "IanTurn"
    And fill in "Name" with "At least he has a name..."
    And fill in "foo@bar.com" for "Email"
    And leave the "Password" field blank
    And press "Save Changes"
    And I should see "Password can't be blank"