When /I enter in basic payment data A/ do
  When %{I fill in the following:}, table(%{
    | Amount       | 750                |
    | Check Number | None               |
  })
end

When /I enter in basic payment data B/ do
  When %{I fill in the following:}, table(%{
    | Amount       | 650                |
    | Check Number | 101                |
  })
end

When /I enter the payment A for tea deposit weighing "(.*)"/ do |weight|
  temp = TeaDeposit.find_by_weight("#{weight}").id
  When 'I fill in "#{temp}_payment_amount" with "750"'
  And 'I fill in "#{temp}_payment_check" with "None"'
end

When /I edit the payment A for tea deposit weighing "(.*)"/ do |weight|
  temp = TeaDeposit.find_by_weight("#{weight}").id
  And 'I fill in "#{temp}_payment_check" with "111"'
end
