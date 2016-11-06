Feature: See more information about a book
  
  Background: Books have been added to database
  
  Given the following books have been added to badreads:
    
    | isbn                   | title          | author       | publication_year | category | edition |search_count    |
    | 9780806539966          | TestBook1      | TestAuthor1  | 1980             | Cat1     | 1       |1               |
    | 9780806539967          | TestBook2      | TestAuthor2  | 1990             | Cat2     | 1       |2               |   
    | 9780806539968          | TestBook3      | TestAuthor1  | 1990             | Cat1     | 1       |3               |
    | 9780806539969          | TestBook4      | TestAuthor3  | 1990             | Cat2     | 1       |4               |
    | 9780806539970          | TestBook5      | TestAuthor5  | 1989             | Cat3     | 2       |5               |
    | 9780806539971          | TestBook6      | TestAuthor1  | 1990             | Cat3     | 2       |5               |
    | 9780806539972          | TestBook7      | TestAuthor6  | 1980             | Cat3     | 3       |7               |
    | 9780806539973          | TestBook8      | TestAuthor7  | 1999             | Cat4     | 2       |8               |
    | 9780806539974          | TestBook4      | TestAuthor3  | 1999             | Cat2     | 2       |9               |
  
  And I am on the badreads home page

Scenario:  Click on the "More Information" link of a particular book a book
  
 Given I have clicked "list books"
 When I have visited the "More information about Harry Potter" page
 Then I should see the wiki for "Harry Potter"

