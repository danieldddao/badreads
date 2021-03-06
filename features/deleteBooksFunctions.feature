Feature: Delete books from the Bad Reads Database

Background: Books have been added to database
  
  Given the following books have been added to badreads:
    
    | isbn                   | title          | author       | publication_year | category | edition |search_count    |
    | 9780806539966          | TestBookNo     | TestAuthorNo | 1980             | Cat1     | 1       |1               |
    | 9780806539967          | TestBook2      | TestAuthor2  | 1990             | Cat2     | 1       |2               |   
    | 9780806539968          | TestBook3      | TestAuthor1  | 1990             | Cat1     | 1       |3               |
    | 9780806539969          | TestBook4      | TestAuthor3  | 1990             | Cat2     | 1       |4               |
    | 9780806539970          | TestBook5      | TestAuthor5  | 1989             | Cat3     | 2       |5               |
    | 9780806539971          | TestBook6      | TestAuthor1  | 1990             | Cat3     | 2       |5               |
    | 9780806539972          | TestBook7      | TestAuthor6  | 1980             | Cat3     | 3       |7               |
    | 9780806539973          | TestBook8      | TestAuthor7  | 1999             | Cat4     | 2       |8               |
    | 9780806539974          | TestBook4      | TestAuthor3  | 1999             | Cat2     | 2       |9               |
  
  And I am on the badreads home page
  
Scenario:  Click on the "DELETE" for adding a book
 Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Staff"
 And I have signed in to my account with email "test@gmail.com", password "123456"
 When I have deleted a book with isbn "9780806539966"
 Then I should see "Book 'TestBookNo' deleted" notice
 And I should not see "TestBookNo" in the book list page