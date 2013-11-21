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

When /I enter the payment B for tea deposit weighing "(.*)"/ do |weight|
  temp = TeaDeposit.find_by_weight("#{weight}").id
  When 'I fill in "#{temp}_payment_amount" with "650"'
  And 'I fill in "#{temp}_payment_check" with "101"'
end

When /I change date of payment with amount "(.*)"/ do |amount|
  temp = Payment.find_by_amount("#{amount}")
  temp.time = '05-01-1979'
  temp.save!
end
