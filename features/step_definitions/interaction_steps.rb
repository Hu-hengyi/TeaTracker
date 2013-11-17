When /^I initialize farms and cps$/ do
  When 'I create basic farms'
  And 'I create basic collection points'
end

When /^I initialize farms, cps, and tea deposits$/ do
  When 'I create basic farms'
  And 'I create basic collection points'
  And 'I create basic tea deposits'
end
