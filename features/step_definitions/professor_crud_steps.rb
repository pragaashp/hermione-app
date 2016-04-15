When /^(?:|I )press "([^"]*)"$/ do |button|
    if button == "New Webcast Request"
        find("#newReq").click
    elsif button == "Edit Request"
        find("#editReq").click
    end
end

Then /^(?:|I )should see the following fields: "([^"]*)"$/ do |fields|
    fieldArr = fields.split(',')
    fieldArr.each do |currField|
        page.should have_content(currField)
    end
end

When /^(?:|I )fill in the following:$/ do |fields|
    fields.rows_hash.each do |name, value|
        if name == 'CCN'
            within("#form1"){ fill_in("ccn", with: value)}
        elsif name == 'Title'
            within("#form1"){ fill_in("course_name", with: value)}
        elsif name == 'Location'
            within("#form1"){ fill_in("location", with: value)}
        elsif name == 'Days'
            within("#form1"){ fill_in("days", with: value)}
        elsif name == 'Request'
            within("#form1"){ fill_in("request_and_layout", with: value)}
        end
    end
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
    infoArr = text.split(',')
    infoArr.each do |name|
        if name == 'CCN'
            within("#form2"){ find_field("ccn", with: value)}
        elsif name == 'Title'
            within("#form2"){ find_field('course_name').value.should eq currInfo}
        elsif name == 'Location'
            within("#form2"){ find_field('location').value.should eq currInfo}
        elsif name == 'Days'
            within("#form2"){ find_field('days').value.should eq currInfo}
        elsif name == 'Request'
            within("#form2"){ find_field('request_and_layout').value.should eq currInfo}
        end
    end
end

Given /^the following requests exist:$/ do |fields|
    fields.rows_hash.each do |name, value|
        if name == 'CCN'
            within("#form2"){ find_field("ccn", with: value)}
        elsif name == 'Title'
            within("#form2"){ find_field('course_name').value.should eq value}
        elsif name == 'Location'
            within("#form2"){ find_field('location').value.should eq value}
        elsif name == 'Days'
            within("#form2"){ find_field('days').value.should eq value}
        elsif name == 'Request'
            within("#form2"){ find_field('request_and_layout').value.should eq value}
        end
    end
    
end

And /^(?:|I )fill the field "([^"]*)" with "([^"]*)"$/ do |fieldName, value|
    if fieldName == "Request"
        within("#form2"){ fill_in('request_and_layout', with: value)}
    end
end

When /^(?:|I ) follow the delete button $/ do
    
end