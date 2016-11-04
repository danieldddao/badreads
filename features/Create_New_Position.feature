Feature: Admin adds new position

Background: books has been added to database
  
  Given the following movies have been added to RottenPotatoes: 
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

Scenario:  User can't add new position
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  When I have signed in to my account with email "test@gmail.com", password "123456"
  Then I should not see "Add Position" button
  And I am on the BadReads home page

Scenario:  Staff can't add new position
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Staff"
  When I have signed in to my account with email "test@gmail.com", password "123456"
  Then I should not see "Add Position" button
  And I am on the BadReads home page
  
Scenario:  Admin can add new position
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  When I have signed in to my account with email "test@gmail.com", password "123456"
  Then I should see "Add Position" button
  And I am on the BadReads home page
  
Scenario: Add new position page
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  When I have signed in to my account with email "test@gmail.com", password "123456"
  And I click "Add Position"
  Then I should see "Create New Position" page
  
Scenario: Admin adds a new position
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  And I click "Add Position"
  When I choose "Staff" from dropdown menu
  And I click "Add New Position"
  And I should see "New Staff added successfuly! Position Code is " notice