Feature: Registered user views list of users he/she is following

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
  
  And I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"

  And the following reviews have been added to Badreads:
  | star       | comment        | book_id      | user_id |
  | 5          | Test Comment   | 1            | 1       |
  | 5          | Test Comment   | 2            | 1       |

Scenario: Unregistered user can't view following
  When I am on the badreads home page
  Then I should not see "Following" button

Scenario: Registered user can view following
  Given I have user account with information: email "follower@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  When I log in to my account with information: email "follower@gmail.com", password "123456"
  Then I should see "Following" button
  
Scenario: Registered user views empty following
  Given I have user account with information: email "follower@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  And I log in to my account with information: email "follower@gmail.com", password "123456"
  When I click "Following"
  Then I should see "All Users followed by you" page
  And I should see "You're currently not following anyone!" notice
  
Scenario: Registered user views following users
  Given I have user account with information: email "follower@gmail.com", first_name "testfirst", last_name "testlast", password "123456", password_confirmation "123456", position "User"
  And I log in to my account with information: email "follower@gmail.com", password "123456"
  And "follower@gmail.com" has followed "test@gmail.com"
  When I click "Following"
  Then I should see "All Users followed by you" page
  And I should see information: "testfirstname", "testlastname", "Test Comment"