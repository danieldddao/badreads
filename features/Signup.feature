Feature: User signs up for new account

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
  
Scenario:  Signup Page
  When I click "Sign Up"
  Then I should see "Sign Up" page

Scenario:  Signup for new account with correct information
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  Then I should see "Sign In" page
  And I should see "Sign up successfuly! Welcome to BadReads!" notice

Scenario:  Signup for new account with wrong email format
  When I click "Sign Up"
  And I've submitted new user's information, email "a@.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  Then I should see "Sign Up" page
  And I should see "Email is invalid" notice
  
Scenario:  Signup for new account with empty first name
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  Then I should see "Sign Up" page
  And I should see "First name can't be blank" notice  
  
Scenario:  Signup for new account with empty last name
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "", password "123456", password_confirmation "123456", position "User"
  Then I should see "Sign Up" page
  And I should see "Last name can't be blank" notice  
  
Scenario:  Signup for new account with empty password
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastnames", password "", password_confirmation "123456", position "User"
  Then I should see "Sign Up" page
  And I should see "Password can't be blank" notice 
  
Scenario:  Signup for new account with wrong password format
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123", password_confirmation "123456", position "User"
  Then I should see "Sign Up" page
  And I should see "Password is too short (minimum is 6 characters)" notice 
  
Scenario:  Signup for new account with empty password confirmation
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "", position "User"
  Then I should see "Sign Up" page
  And I should see "Password confirmation can't be blank" notice   
  
Scenario:  Signup for new account with wrong password confirmation
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123", position "User"
  Then I should see "Sign Up" page
  And I should see "Password confirmation doesn't match Password" notice   
  
Scenario:  Signup for new account with empty code for staff
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Staff"
  Then I should see "Sign Up" page
  And I should see "Position code must not be empty if selected role is 'Staff'" notice  
  
Scenario:  Signup for new account with empty code for admin
  When I click "Sign Up"
  And I've submitted new user's information, email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "Admin"
  Then I should see "Sign Up" page
  And I should see "Position code must not be empty if selected role is 'Admin'" notice  