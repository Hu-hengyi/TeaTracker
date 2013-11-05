When /I enter in basic collection point data A/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Collection Point A |
    | Latitude  | -35.010                  |
    | Longitude | 35.010                   |
  })
end

When /I enter in basic collection point data B/ do
  When %{I fill in the following:}, table(%{
    | Name      | Basic Collection Point B |
    | Latitude  | -40.010                  |
    | Longitude | 40.010                   |
  })
end

When /I edit the collection point named "(.*)"/ do |name|
  temp = CollectionPoint.find_by_title("#{name}").id
  visit "/cp/#{temp}/edit"
end
