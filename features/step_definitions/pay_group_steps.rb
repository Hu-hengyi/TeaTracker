When /I enter in basic pay group data A/ do
  When 'I fill in "Name" with "Pay Group A"'
  And 'I fill in "Notes" with "primary grouping"'
end

When /I enter in basic pay group data B/ do
  When 'I fill in "Name" with "Pay Group B"'
  And 'I fill in "Notes" with "secondary grouping"'
end

When /I edit the pay group named "(.*)"/ do |name|
  temp = PayGroup.find_by_name("#{name}").id
  visit "/pay_groups/#{temp}/edit"
end

When /^I create basic pay groups$/ do
  When 'I go to the Create New Pay Group page'
  And 'I enter in basic pay group data A'
  And 'I press "create_pay_group"'
  And 'I go to the Create New Pay Group page'
  And 'I enter in basic pay group data B'
  And 'I press "create_pay_group"'
end
