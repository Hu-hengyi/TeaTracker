Feature: add a payment with its inputted data

  As an admin
  So that I can keep a record of payments made
  I want to be able record the check number and amount for each payment

Scenario: add a new payment from the Tea Deposits list page
  Given Pending Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the home page
  When I follow "Tea Deposits"
  And I enter the payment A for tea deposit weighing 1000
  #currently noting the field being filled in as #{id of that tea deposit}_payment_amount and _check
  #currently assuming that the entering of the information automatcally makes the payment
  And I go to the payments page
  Then I should see "750"

#there are no sad paths at this time as payments are allowed to be blank
