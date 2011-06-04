When /^I submit the form$/ do
  When %{I press "Submit"}
end

Then /^I should see "([^\"]*)" in the errors section$/ do |error_message|
  Then %{I should see "#{error_message}" within "//div[@class='errors')]}
end