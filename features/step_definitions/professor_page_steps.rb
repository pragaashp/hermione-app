# Then /^(?:|I )should see a "([^"]*)"$/ do |text|
#   if text.eql?("New Webcast Request")
#     page.all(".create-link").count.should == 1
#   elsif text.eql?("Edit Request")
#     expect(page).to have_selector('.edit-link')
#   end
#
# end
#
# And /^I have at least one class$/ do
#   page.all('#classesTable').count.should == 1
# end

Given /^that professor "(.*)" exists$/ do |name|
  Professor.create!(name: name)
end