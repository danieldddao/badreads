Feature: User signs in to his/her account

Background: books has been added to database
  
  Given the following movies have been added to RottenPotatoes: 
  | isbn                   | title          | author       | publication_year | category | edition |
  | 9780806539966          | Test Book1     | TestAuthor1  | 1980             | Cat1     | 1       |
  | 9780806539967          | TestBook2      | TestAuthor2  | 1990             | Cat2     | 1       |
  | 9780806539968          | Test Book3     | TestAuthor1  | 1990             | Cat1     | 1       |
  | 9780806539969          | TestBook4      | TestAuthor3  | 1990             | Cat2     | 1       |
  | 9780806539970          | TestBook5      | TestAuthor5  | 1989             | Cat3     | 2       |
  | 9780806539971          | TestBook6      | TestAuthor1  | 1990             | Cat3     | 2       |
  | 9780806539972          | TestBook7      | TestAuthor6  | 1980             | Cat3     | 3       |
  | 9780806539973          | TestBook8      | TestAuthor7  | 1999             | Cat4     | 2       |
  | 9780806539974          | TestBook4 book | TestAuthor3  | 1999             | Cat2     | 2       |

  And I am on the BadReads home page
  
Scenario:  Signin Page
  When I click "Sign In"
  Then I should see "Sign In" page

Scenario:  Signin for wrong email/password combination
  When I click "Sign In"
  And I click "Login to my account"
  Then I should see "Invalid email/password combination" notice

Scenario:  Signin for correct email and password
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  When I click "Sign In"
  And I enter the email "test@gmail.com" and password "123456"
  And I click "Login to my account"
  Then I am on the BadReads home page
  And I should see "Welcome testfirstname testlastname!" notice
  And I should see "test@gmail.com" notice
