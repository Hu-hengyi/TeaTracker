When /I enter in basic pickup data A/ do
  When %{I fill in the following:}, table(%{
    | Farm      | Basic Pickup A   |
    | Weight    | 1000             |
    | Notes     | None             |
  })
end

When /I enter in basic pickup data B/ do
  When %{I fill in the following:}, table(%{
    | Farm      | Basic Pickup B   |
    | Weight    | 200              |
    | Notes     | Good Quality     |
  })
end

When /I edit the pickup named "(.*)"/ do |name|
  temp = Pickup.find_by_title("#{name}").id)}
  visit "/pickup/#{temp}/edit"
end
