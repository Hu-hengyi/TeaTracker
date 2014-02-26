When /^I initialize farms and cps$/ do
  When 'I create basic pay groups'
  And 'I create basic farms'
  And 'I create basic collection points'
end

When /^I initialize farms, cps, and tea deposits$/ do
  When 'I create basic pay groups'
  And 'I create basic farms'
  And 'I create basic collection points'
  And 'I create basic tea deposits'
end

When /^I initialize farms, cps, tds, and payments$/ do
  When 'I initialize farms, cps, and tea deposits'
  Given 'I am on the home page'
  When 'I follow "Tea Deposits"'
  And 'I enter the payment A for tea deposit weighing "1000"'
  And 'I enter the payment B for tea deposit weighing "200"'
end

