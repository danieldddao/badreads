Given(/^the following books have been added to Badreads:$/) do |table|
   table.hashes.each do |book|
    Book.create!(book)
  end
end

Given(/^I am on the BadReads home page$/) do
  visit books_path
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_on arg1
end

Then(/^I should see "([^"]*)" page$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I've submitted new user's information, email "([^"]*)", first_name "([^"]*)", last_name "([^"]*)", password "([^"]*)", password_confirmation "([^"]*)", position "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6|  
  fill_in 'user_email', :with => arg1
  fill_in 'user_first_name', :with => arg2
  fill_in 'user_last_name', :with => arg3
  fill_in 'user_password', :with => arg4
  fill_in 'user_password_confirmation', :with => arg5
  select arg6, :from => 'role_position'
  click_on "Create my account"
end

Then(/^I should see "([^"]*)" notice$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I have user account with information: email "([^"]*)", first_name "([^"]*)", last_name "([^"]*)", password "([^"]*)", password_confirmation "([^"]*)", position "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
  User.create!(:email => arg1, :first_name => arg2, :last_name => arg3, :password => arg4, :password_confirmation => arg5, :position => arg6)
end

When(/^I enter the email "([^"]*)" and password "([^"]*)"$/) do |arg1, arg2|
  fill_in 'session_email', :with => arg1
  fill_in 'session_password', :with => arg2
end

Then(/^I should not see "([^"]*)" button$/) do |arg1|
  expect(page).not_to have_button(arg1)
end

When(/^I log in to my account with information: email "([^"]*)", password "([^"]*)"$/) do |arg1, arg2|  
  visit login_path
  fill_in 'session_email', :with => arg1
  fill_in 'session_password', :with => arg2
  click_on "Login to my account"
end

Then(/^I should see "([^"]*)" button$/) do |arg1|
  expect(page).to have_button(arg1)
end

When(/^I have signed in to my account with email "([^"]*)", password "([^"]*)"$/) do |arg1, arg2|
  click_on "Sign In"
  fill_in 'session_email', :with => arg1
  fill_in 'session_password', :with => arg2
  click_on "Login to my account"
end

When(/^I choose "([^"]*)" from dropdown menu$/) do |arg1|
  select arg1, :from => 'role_position'
end

Then(/^I should not see "([^"]*)" field$/) do |arg1|
  puts page.body
end

Given(/^I have a role with information: role "([^"]*)", role position "([^"]*)"$/) do |arg1, arg2|
  Role.create!(:position => arg1, :position_code => arg2)
end

When(/^I've submitted new user's information, email "([^"]*)", first_name "([^"]*)", last_name "([^"]*)", password "([^"]*)", password_confirmation "([^"]*)", position "([^"]*)", position code "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7|
  visit new_user_path
  fill_in 'user_email', :with => arg1
  fill_in 'user_first_name', :with => arg2
  fill_in 'user_last_name', :with => arg3
  fill_in 'user_password', :with => arg4
  fill_in 'user_password_confirmation', :with => arg5
  select arg6, :from => 'role_position'
  fill_in 'position_code', :with => arg7
  click_on "Create my account"
end

When(/^I update my password with new password "([^"]*)" and using current password "([^"]*)"$/) do |arg1, arg2|
  visit edit_user_path(1)
  fill_in 'user_current_password', :with => arg2
  fill_in 'user_new_password', :with => arg1
  fill_in 'user_password', :with => arg1
  click_on "Update User"
end