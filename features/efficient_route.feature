Feature: view efficient routing of tractors

  As an admin
  So that I effectively plan tractor routes
  I want to be able to view an efficient pathing solution based on the system's data

Background:
  Given I am logged in
  When I initialize farms, cps, and tea deposits

Scenario: view routes based on established data
  Given I am on the routes page
  Then I should see "Tractor A"
  Then I should see both "Basic Collection Point A" before "Basic Collection Point B"
