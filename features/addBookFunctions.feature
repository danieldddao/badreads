Feature: Add books to the Bad Reads Database

Scenario:  Click on the "ADD" for adding a book

 Given I am on the badreads home page
 When I have added a book with title "Harry Potter" and author "JK Rowling" and ISBN "12334567890"
 Then I should see "Harry Potter" in book list page


