When /I enter in basic farm data/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Farm       |
    | Bushes    | 2000             |
    | Workers   | 8                |
    | Longitude | 35.628262        |
    | Latitude  | -15.928978       |
    | Notes     | Doing great work |
  })
end

Then /I will see the basic farm/ do
  step 'Then I should see "Basic Farm"'
end

Then /I should see "(.*)"/ do |item|
  myPage = page.body.to_s
  assert myPage.index(item.to_s) != nil
end


