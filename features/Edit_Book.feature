Feature: Admin/Staff edits book's information

Background: books has been added to database
  
  Given the following books have been added to Badreads: 
  | isbn                   | title          | author       | publication_year | category | edition | search_count |
  | 9780806539966          | Test Book1     | TestAuthor1  | 1980             | Cat1     | 1       | 10           |
  | 9780806539967          | TestBook2      | TestAuthor2  | 1990             | Cat2     | 1       | 10           |
  | 9780806539968          | Test Book3     | TestAuthor1  | 1990             | Cat1     | 1       | 8            |
  | 9780806539969          | TestBook4      | TestAuthor3  | 1990             | Cat2     | 1       | 2            |
  | 9780806539970          | TestBook5      | TestAuthor5  | 1989             | Cat3     | 2       | 1            |
  | 9780806539971          | TestBook6      | TestAuthor1  | 1990             | Cat3     | 2       | 2            |
  | 9780806539972          | TestBook7      | TestAuthor6  | 1980             | Cat3     | 3       | 3            |
  | 9780806539973          | TestBook8      | TestAuthor7  | 1999             | Cat4     | 2       | 4            |
  | 9780806539974          | TestBook4 book | TestAuthor3  | 1999             | Cat2     | 2       | 6            |

  And I am on the BadReads home page
  
Scenario:  Unregistered User can't edit book
  When I follow "Test Book1"
  Then I should not see "Edit this book" button
  
Scenario:  Registered User can't edit book
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  Then I should not see "Edit this book" button
  
Scenario:  Registered Staff can edit book
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Staff"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  Then I should see "Edit This Book" button  
  
Scenario:  Registered Admin can edit book
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  Then I should see "Edit This Book" button
  
Scenario:  Edit book's title with new title
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  And I click "Edit This Book"
  And I update "Title" with "New Test Book"
  Then I should see "Title was successfully updated" notice

Scenario:  Edit book's isbn with new isbn
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  And I click "Edit This Book"
  And I update "ISBN" with "1"
  Then I should see "ISBN was successfully updated" notice
  
Scenario:  Edit book's author with new author
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  And I click "Edit This Book"
  And I update "Author" with "New Test Author"
  Then I should see "Author was successfully updated" notice  
  
Scenario:  Edit book's summary with new summary
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  And I click "Edit This Book"
  And I update "Summary" with "New Summary"
  Then I should see "Summary was successfully updated" notice    
  
Scenario:  Edit book's publisher with new publisher
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  And I click "Edit This Book"
  And I update "Publisher" with "New Test Publisher"
  Then I should see "Publisher was successfully updated" notice  
  
Scenario:  Edit book's edition with new edition
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  And I click "Edit This Book"
  And I update "Edition" with "New Edition"
  Then I should see "Edition was successfully updated" notice 