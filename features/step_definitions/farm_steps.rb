When /I enter in basic farm data A/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Farm A     |
    | Bushes    | 2000             |
    | Workers   | 8                |
    | Longitude | 35.628262        |
    | Latitude  | -15.928978       |
    | Notes     | Doing great work |
  })
end

When /I enter in basic farm data B/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Farm B      |
    | Bushes    | 1000              |
    | Workers   | 5                 |
    | Longitude | 35.628260         |
    | Latitude  | -15.928970        |
    | Notes     | Doing pretty well |
  })
end

When I create basic farms:
  Given I am on the FarmList home page
  When I follow "create_farm"
  And I enter in basic farm data A
  And I press "create_farm"
  And I follow "create_farm"
  And I enter in basic farm data B
  And I press "create_farm"

Then /I will see the basic farm/ do
  step 'Then I should see "Basic Farm A"'
end

Then /I should see "(.*)"/ do |item|
  myPage = page.body.to_s
  assert myPage.index(item.to_s) != nil
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  myPage = page.body.to_s
  assert myPage.index(e1.to_s) < myPage.index(e2.to_s)
end


