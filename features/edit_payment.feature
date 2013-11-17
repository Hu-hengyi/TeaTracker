Feature: edit a payment with its inputted data

  As an admin
  So that I can fix an error in an entered payments
  I want to be able to change the check number and amount for a payment

Scenario: add a new payment from the Tea Deposits list page
  Given Pending Given I am logged in
  When I initialize farms, cps, and tea deposits
  Given I am on the home page
  When I follow "Tea Deposits"
  And I edit the payment A for tea deposit weighing 1000
  #currently noting the field being filled in as #{id of that tea deposit}_payment_check
  #currently assuming nothing is needed to enable editability
  And I go to the payments page
  Then I should see "111"

#there are no sad paths at this time as payments are allowed to be blank
