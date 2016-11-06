## Background Conditions ##
Given /the following books have been added to badreads:/ do |books_table|
    books_table.hashes.each do |book|
            @books = Book.create!(book)
    end
end
## End Background Conditions ##

Given /^I am on the badreads home page$/ do
  visit root_path
    end

## ADD Books##
When /^I have added a book with title "(.*?)" and author "(.*?)" and ISBN "(.*?)"$/ do |title, author, isbn|
  visit books_new_path
  fill_in 'Title', :with => title
  fill_in 'Author', :with => author
  fill_in 'ISBN', :with => isbn
  click_button 'Save Changes'
    end

Then /^I should see "(.*?)" in book list page$/ do |title| 
   visit books_list_path
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
    end

## Delete Books ##
When /^I have deleted a book with title "(.*?)" and author "(.*?)"$/ do |title, author|
  visit books_delform_path
  fill_in 'Title', :with => title
  fill_in 'Author', :with => author
  click_button 'Save Changes'
    end

Then /^I should not see "(.*?)" in the book list page$/ do |title| 
   visit books_list_path
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title)
       result = true
       break
     end
   end  
  expect(result).to be_falsey
    end

## Search Books ##
When /^I have searched a book with title "(.*?)"$/ do |title|
  fill_in 'Search', :with => title
  click_button 'Search'
    end

Then /^I should see "(.*?)" in the search results$/ do |title|
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
    end
    
## TOP search results ##

When /^I have visited the "top search results" page$/ do
  visit books_topten_path
    end

Then /^I should see the top search results$/ do
    # PENDING
    end

##  More Information About a book ##

When /^I have visited the "(.*?)" page$/ do |title|
  visit books_list_path
  click_link title
    end

Then /^I should see the wiki for "(.*?)"$/ do |title|
   
    end
    
When(/^I have visited the Details about "(.*?)" page$/) do |title|
   visit books_path
   click_on "#{title}"
 end
When(/^I follow "([^"]*)"$/) do |arg1|
  click_on arg1
end