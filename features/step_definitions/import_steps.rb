When /^I upload a file with valid data for farms$/ do
  attach_file("file", File.join(Rails.root, 'features/upload_files/farms.csv'))
end

When /^I upload a file with valid data for tea deposits$/ do
  attach_file("file", File.join(Rails.root, 'features/upload_files/deposits.csv'))
end

When /^I upload a file with valid data for cps$/ do
  attach_file("file", File.join(Rails.root, 'features/upload_files/cps.csv'))
end

When /^I import$/ do
  click_button "Import"
end

Then /^I should receive a file(?: "([^"]*)")?/ do |file|
  result = page.response_headers['Content-Type'].should == "application/octet-stream"
  if result
    result = page.response_headers['Content-Disposition'].should =~ /#{file}/
  end
  result
end


#File.join('home/saasbook/Lujeri/TeaTracker', 'features', 'upload_files', 'farms.csv'))

