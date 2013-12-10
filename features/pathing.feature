Feature: view efficient routes calculated via CVRP

  As an admin
  So that I can coordinate my tractors as efficiently as possible
  I want to be able to view the most effient route between the waypoints

Background:
  Given I am logged in
  And I am on the farms page

Scenario: view efficient routes
  When I follow "Pathing"
  Then I should see "Tractor"
  Then I should see "Route"
