require 'uri'

Given /^the following requests exist:$/ do |requests_table|
  requests_table.hashes.each do |r|
    prof = Professor.create!(name: r['Professor'])
    req = Request.create!(comments: 'No Comments.', format: r['Format'], status: ((r['Status'].eql? 'Approved') ? 1 : ((r['Status'].eql? 'Declined') ? -1 : 0)) )
    prof.courses.create!(abbreviation: r['Abbreviation'], ccn: r['CCN'], days: r['Days'], location: r['Location'], start_time: r['Time'].split('-')[0], end_time: r['Time'].split('-')[1], request: req)
  end
end

Then /^I should see requests for the following courses: "(.*)"$/ do |courses|
  courses.split(',').each { |c| step %{I should see "#{c}"} }
end

Then /^I should not see requests for the following courses: "(.*)"$/ do |courses|
  courses.split(',').each { |c| step %{I should not see "#{c}"} }
end


Then /^I should see "(.*)" before "(.*)"$/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  page.body.should =~ regexp
end

And /^I should see the following fields: "(.*)"$/ do |fields|
  fields.split(',').each { |f| step %{I should see "#{f}"} }
end

Then /^I should see a table named "(.*)"$/ do |table_name|
  page.should have_content(table_name)
end

And /^I should see a column named "(.*)"$/ do |col_name|
  page.should have_content(col_name)
end

When /^I follow "(.*)" and I get redirected$/ do |link|
  begin
    click_link(link)
  rescue ActionController::RoutingError => e
    expect(e.message).to match(/\/cas\/login/)
  end
end