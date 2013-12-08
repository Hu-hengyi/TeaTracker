When /I enter in basic collection point data A/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Collection Point A |
    | Latitude  | -35.010                  |
    | Longitude | 35.010                   |
  })
end

#need to add in notes

When /I enter in basic collection point data B/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Collection Point B |
    | Latitude  | -40.010                  |
    | Longitude | 40.010                   |
  })
end

When /I edit the collection point named "(.*)"/ do |name|
  temp = Cp.find_by_name("#{name}").id
  visit "/cps/#{temp}/edit"
end

When /^I create basic collection points$/ do
  When 'I go to the Create New Collection Point page'
  And 'I enter in basic collection point data A'
  And 'I press "create_cp"'
  And 'I go to the Create New Collection Point page'
  And 'I enter in basic collection point data B'
  And 'I press "create_cp"'
end
