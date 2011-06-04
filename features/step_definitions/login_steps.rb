Then /^I should be logged in$/ do
  Then %{I should see "Logout" within "//div[contains(@class='login_status')"}
end

Then /^I should be logged out$/ do
  Then %{I should see "Login" within "//div[contains(@class='login_status')"}
end