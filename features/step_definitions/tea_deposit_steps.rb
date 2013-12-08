When /I enter in basic tea deposit data A/ do
  When 'I fill in "deposit_weight" with "1000"'
  And 'I select "Basic Collection Point A" from "deposit_cp_id"'
  And 'I select "Basic Farm A" from "deposit_farm_id"'
  And 'I select "Very Good" from "deposit_quality"'
  And 'I select "2009" from "deposit_weighed_at_1i"'
  And 'I select "January" from "deposit_weighed_at_2i"'
  And 'I select "20" from "deposit_weighed_at_3i"'
  And 'I select "10" from "deposit_weighed_at_4i"'
  And 'I select "10" from "deposit_weighed_at_5i"'
  And 'I select "10" from "deposit_weighed_at_6i"'
end

When /I enter in basic tea deposit data B/ do
  When 'I fill in "deposit_weight" with "200"'
  And 'I select "Basic Collection Point B" from "deposit_cp_id"'
  And 'I select "Basic Farm B" from "deposit_farm_id"'
  And 'I select "Bad" from "deposit_quality"'
  And 'I select "2010" from "deposit_weighed_at_1i"'
  And 'I select "December" from "deposit_weighed_at_2i"'
  And 'I select "10" from "deposit_weighed_at_3i"'
  And 'I select "09" from "deposit_weighed_at_4i"'
  And 'I select "59" from "deposit_weighed_at_5i"'
  And 'I select "59" from "deposit_weighed_at_6i"'
end

When /I edit the tea deposit weighing "(.*)"/ do |weight|
  temp = Deposit.find_by_weight("#{weight}").id
  visit "/deposits/#{temp}/edit"
end

When /^I create basic tea deposits$/ do
  When 'I go to the Create New Tea Deposit page'
  And 'I enter in basic tea deposit data A'
  And 'I press "create_deposit"'
  And 'I go to the Create New Tea Deposit page'
  And 'I enter in basic tea deposit data B'
  And 'I press "create_deposit"'
end

When /I change date of tea deposit weighing "(.*)"/ do |weight|
  temp = Deposit.find_by_weight("#{weight}")
  temp.time = '05-01-1979'
  temp.save!
end
