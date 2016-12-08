Feature: Staff/Admin signs up for their account using position code

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
  
Scenario:  Staff signs up with correct staff position code
  Given I have a role with information: role "Staff", role position "StaffTest1"
  When I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Staff", position code "StaffTest1"
  Then I should see "Sign In" page
  And I should see "Sign up successfuly! Please confirm your email address" notice
  
Scenario:  Staff signs up with incorrect staff position code
  Given I have a role with information: role "Staff", role position "StaffTest2"
  When I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Staff", position code "Admin1"
  Then I should see "Sign Up" page
  And I should see "Position code is invalid" notice

Scenario:  Admin signs up with correct admin position code
  Given I have a role with information: role "Admin", role position "AdminTest1"
  When I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin", position code "AdminTest1"
  Then I should see "Sign In" page
  And I should see "Sign up successfuly! Please confirm your email address" notice
  
Scenario:  Staff signs up with incorrect staff position code
  Given I have a role with information: role "Admin", role position "AdminTest2"
  When I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Staff", position code "Admin1"
  Then I should see "Sign Up" page
  And I should see "Position code is invalid" notice