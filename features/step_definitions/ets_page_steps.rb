Given /the following requests exist/ do |requests_table|
  requests_table.hashes.each do |request|
    professor1 = Professor.create({:name=>request[:Professor], :department=>"Computer Science"})
    request1 = Request.create({:comments=>request[:Request], :status=>request[:Status]})
    Course.create({:ccn =>request[:CCN],:title => request[:Title],:location =>request[:Location], :days=>request[:Days], :time=>request[:Time], 
    :request=>request1,:professors=>[professor1]})
  end
end

Then /I should see requests for the following courses: (.*)/ do |course_list|
  course_list.split(",").each do |course|
    puts course
    page.should have_content(course)
  end
end

Then /I should not see requests for the following courses: (.*)/ do |course_list|
  course_list.split(",").each do |course|
    page.should have_no_content(course)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  first_position = page.body.index(e1)
  second_position = page.body.index(e2)
  first_position.should < second_position
end

Then /I should see the following fields: (.*)/  do |field_list|
  field_list.split(",").each do |field|
    page.should have_content(field)
  end
end

Then /^I should see a table named "(.*)"$/ do |table_name|
  page.should have_content(table_name)
end

And /^I should see a column named "(.*)"$/ do |col_name|
  page.should have_content(col_name)
end