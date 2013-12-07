And(/^a deposit from "([^"]*)" that weighs "([^"]*)" pounds$/) do |time, weight|
  create(:deposit, weighed_at: Time.parse(time + " UTC"), weight: weight)
end

And(/^I select (".*") as the time from "([^"]*)"/) do |timeString, from|
  date = Date.today
  time = Time.parse(timeString)
  field = from.downcase.tr(" ", "_")
  select(date.strftime("%Y"), from: "deposit_#{field}_1i")
  select(date.strftime("%B"), from: "deposit_#{field}_2i")
  select(date.strftime("%-d"), from: "deposit_#{field}_3i")
  select(time.strftime("%H"), from: "deposit_#{field}_4i")
  select(time.strftime("%M"), from: "deposit_#{field}_5i")
  select(time.strftime("%S"), from: "deposit_#{field}_6i")
end

When(/^I do nothing$/) do
  ;
end