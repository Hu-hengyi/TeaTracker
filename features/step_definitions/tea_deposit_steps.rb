When /I enter in basic tea deposit data A/ do
  When %{I fill in the following:}, table(%{
    | CP        | Basic CP A          |
    | Farm      | Basic Farm A        |
    | Weight    | 1000                |
    | Notes     | None                |
  })
end

When /I enter in basic tea deposit data B/ do
  When %{I fill in the following:}, table(%{
    | CP        | Basic CP B          |
    | Farm      | Basic Farm B        |
    | Weight    | 200                 |
    | Notes     | Good Quality        |
  })
end

When /I edit the tea deposit weighing "(.*)"/ do |weight|
  temp = TeaDeposit.find_by_weight("#{weight}").id
  visit "/teadeposit/#{temp}/edit"
end

When /^I create basic tea deposits$/ do
  When 'I go to the Create New Tea Deposit page'
  And 'I enter in basic tea deposit data A'
  And 'I press "create_tea_deposit"'
  And 'I go to the Create New Tea Deposit page'
  And 'I enter in basic tea deposit data B'
  And 'I press "create_tea_deposit"'
end
