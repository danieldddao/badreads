Feature: User logs out from his/her account

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
 
Scenario:  Top Reviews
  When I follow "Test Book1"
  Then I should see "Top Reviews"

Scenario: Top Reviews - no reviews
  When I follow "Test Book1"
  Then I should see "There're currently no reviews for this book!"
  
Scenario:  No Post Review Button for Unregistered User
  When I follow "Test Book1"
  Then I should see "Please Sign-In to post review!"
  And I should not see "Submit Review" button
  
Scenario: Review Button for Registered User
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  When I follow "Test Book1"
  Then I should see "Post New Review"
  And I should see "Submit Review" button
  
Scenario: Registered User posts review
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  And I've posted a review for the book's isbn "9780806539966" with rating "5" and comment "Good book!" 
  When I follow "Test Book1"
  Then I should see "You already posted review for this book!"
  And I should not see "Submit Review" button

Scenario: Registered User views his/her review
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  And I've posted a review for the book's isbn "9780806539966" with rating "5" and comment "Good book!" 
  And I follow "Test Book1"
  When I click "My Review"
  Then I should see "Good book!"
  
Scenario: Registered User views all reviews
  Given I have user account with information: email "test@gmail.com", first_name "testfirstname", last_name "testlastname", password "123456", password_confirmation "123456", position "User"
  And I have signed in to my account with email "test@gmail.com", password "123456"
  And I've posted a review for the book's isbn "9780806539966" with rating "5" and comment "Good book!" 
  And I follow "Test Book1"
  Then I should see "View All Reviews"