Feature: Token authentication

  As an intern
  So that I can access the server from a mobile device
  I want to be able to associate a token, rather than a cookie, with my login


  # Happy Path :)
  Scenario:
    When I access the farms page with a valid token
    Then I should be on the farms page

  # Sad Path :(
  Scenario:
    When I access the farms page with an invalid token