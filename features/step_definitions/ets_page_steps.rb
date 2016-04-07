# Given /the following requests exist/ do |requests_table|
#   requests_table.hashes.each do |request1|
#
#   end
# end

# Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#   regexp = /#{e1}.*#{e2}/m
#   page.body.should =~ regexp
# end

# Given /^I click on "([^"]*)"$/ do |arg1|

# end

Then /^I should see a table named "(.*)"$/ do |table_name|
  page.should have_content(table_name)
end

And /^I should see a column named "(.*)"$/ do |col_name|
  page.should have_content(col_name)
end