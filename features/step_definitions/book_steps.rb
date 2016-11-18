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
When(/^I have added a book with title "([^"]*)" and author "([^"]*)" and ISBN "([^"]*)" and Category "([^"]*)" and Edition "([^"]*)" and publication year "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
    visit new_book_path
    fill_in 'book_title', :with => arg1
    fill_in 'book_author', :with => arg2
    fill_in 'book_isbn', :with => arg3
    fill_in 'book_category', :with => arg4
    fill_in 'book_edition', :with => arg5
    fill_in 'book_publication_year', :with => arg6
    click_on "Save Changes"
end

Then /^I should see "(.*?)" in book list page$/ do |title| 
   visit allbooks_path
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
  visit booksdelform_path
  fill_in 'book_title', :with => title
  fill_in 'book_author', :with => author
  click_on 'Save Changes'
end

Then /^I should not see "(.*?)" in the book list page$/ do |title| 
   visit allbooks_path
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
  fill_in 'search_box', :with => title
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
  visit allbooks_path
  click_on arg1
end

Then(/^I should see "([^"]*)"$/) do |arg1|
    expect(page).to have_content(arg1)
 end

Then(/^I should not see "([^"]*)"$/) do |arg1|
   result=false
   all("tr").each do |tr|
     if tr.has_content?(arg1)
       result = true
       break
     end
   end  
  expect(result).to be_falsey
end

## Edit book ##
When(/^I update "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in 'new_' + arg1.downcase + '_', :with => title
  click_on "Update Book's " + arg1
end

## Review book ##
Given(/^I've posted a review for the book's isbn "([^"]*)" with rating "([^"]*)" and comment "([^"]*)"$/) do |arg1, arg2, arg3|
    book = Book.find_by_isbn(arg1)
    Review.create!(:star => arg2, :comment => arg3, :book_id => book.id, :user_id => 1)
end

Then (/^I should see "([^"]*)" before "([^"]*)"$/) do |one, sec|
  first = page.body.index(one)
  second = page.body.index(sec)
  first.should < second
end