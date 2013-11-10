When /I enter in basic tea deposit data A/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Tea Deposit A |
    | CP        | Basic CP A          |
    | Farm      | Basic Farm A        |
    | Weight    | 1000                |
    | Notes     | None                |
  })
end

When /I enter in basic tea deposit data B/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Tea Deposit B |
    | CP        | Basic CP B          |
    | Farm      | Basic Farm B        |
    | Weight    | 200                 |
    | Notes     | Good Quality        |
  })
end

When /I edit the pickup named "(.*)"/ do |name|
  temp = TeaDeposit.find_by_title("#{name}").id
  visit "/teadeposit/#{temp}/edit"
end
