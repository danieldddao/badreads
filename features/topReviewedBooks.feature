Feature: See top Searched Books
  
  Background: Books have been added to database
  
  Given the following books have been added to badreads:
    
    | isbn                   | title          | author       | publication_year | category | edition | reviews_count |
    | 9780806539966          | TestBook1      | TestAuthor1  | 1980             | Cat1     | 1       | 10            |
    | 9780806539967          | TestBook2      | TestAuthor2  | 1990             | Cat2     | 1       | 9             |
    | 9780806539968          | TestBook10     | TestAuthor1  | 1990             | Cat1     | 1       | 6             |
    | 9780806539969          | TestBook4      | TestAuthor3  | 1990             | Cat2     | 1       | 2             |
    | 9780806539970          | TestBook5      | TestAuthor5  | 1989             | Cat3     | 2       | 8             |
    | 9780806539971          | TestBook6      | TestAuthor1  | 1990             | Cat3     | 2       | 7             |
    | 9780806539972          | TestBook7      | TestAuthor6  | 1980             | Cat3     | 3       | 6             |
    | 9780806539973          | TestBook8      | TestAuthor7  | 1999             | Cat4     | 2       | 4             |
    | 9780806539974          | TestBook9      | TestAuthor3  | 1999             | Cat2     | 2       | 5             |
    | 9780806539975          | TestBook3      | TestAuthor3  | 1999             | Cat2     | 2       | 1             |
    | 9780806539976          | TestBookNo     | TestAuthor3  | 1999             | Cat2     | 2       | 0             |

  
Scenario:  Only top 10 reviewed books showed on home page
 When I am on the badreads home page
 Then I should not see "TestBookNo"
 And I should see "TestBook1" before "TestBook2"
 And I should see "TestBook2" before "TestBook5"
 And I should see "TestBook5" before "TestBook6"
 And I should see "TestBook6" before "TestBook7" 
 And I should see "TestBook10" before "TestBook3" 