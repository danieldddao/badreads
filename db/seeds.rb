# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

books =  [
    {:img => "books/9780806539966.jpg", :isbn => '9780806539966', :title => 'Wizard: The Life and Times of Nikola Tesla : Biography of a Genius', :author => 'Seifer, Marc J.', :publisher => 'Citadel Pr', :summary => 'The story of one of the most prolific, independent, and iconoclastic inventors of this century . . . fascinating', :publication_year => '2016', :category => 'Science & Technology', :edition => 'Reprint', :search_count => 10},
    {:img => "books/9780763676193.jpg", :isbn => '9780763676193', :title => 'Monsters of Men', :author => 'Patrick Ness', :publisher => 'Candlewick Press (MA)', :summary => 'As a world-ending war surges around them, Todd and Viola face monstrous decisions. The indigenous Spackle, thinking and acting as one, have mobilized to avenge their murdered people. Ruthless human leaders prepare to defend their factions at all costs, even as a convoy of new settlers approaches. And as the ceaseless Noise lays all thoughts bare, the projected will of the few threatens to overwhelm the desperate desire of the many.', :publication_year => '2014', :category => 'Adventure', :edition => '2nd', :search_count => 10},
    {:img => "books/9781285740621.jpg", :isbn => '9781285740621', :title => 'Calculus', :author => 'James Stewart', :publisher => 'Cengage Learning', :summary => "James Stewart's CALCULUS texts are widely renowned for their mathematical precision and accuracy, clarity of exposition, and outstanding examples and problem sets. Millions of students worldwide have explored calculus through Stewart's trademark style, while instructors have turned to his approach time and time again. In the Eighth Edition of CALCULUS, Stewart continues to set the standard for the course while adding carefully revised content. The patient explanations, superb exercises, focus on problem solving, and carefully graded problem sets that have made Stewart's texts best-sellers continue to provide a strong foundation for the Eighth Edition. From the most unprepared student to the most mathematically gifted, Stewart's writing and presentation serve to enhance understanding and build confidence.", :publication_year => '2015', :category => 'Science & Mathematics', :edition => '8th', :search_count => 8},
    {:img => "books/9781771642484.jpg", :isbn => '9781771642484', :title => 'The Hidden Life of Trees: What They Feel, How They Communicate', :author => 'Peter Wohlleben', :publisher => 'Greystone Books', :summary => "Are trees social beings? In this international bestseller, forester and author Peter Wohlleben convincingly makes the case that, yes, the forest is a social network. He draws on groundbreaking scientific discoveries to describe how trees are like human families: tree parents live together with their children, communicate with them, support them as they grow, share nutrients with those who are sick or struggling, and even warn each other of impending dangers. Wohlleben also shares his deep love of woods and forests, explaining the amazing processes of life, death, and regeneration he has observed in his woodland.", :publication_year => '2016', :category => 'Science & Mathematics', :edition => '1st', :search_count => 9},
    {:img => "books/9781119293491.jpg", :isbn => '9781119293491', :title => 'Calculus For Dummies', :author => 'Mark Ryan', :publisher => 'For Dummies', :summary => "Calculus For Dummies, 2nd Edition makes calculus manageable—even if you're one of the many students who sweat at the thought of it. By breaking down differentiation and integration into digestible concepts, this guide helps you build a stronger foundation with a solid understanding of the big ideas at work. This user-friendly math book leads you step-by-step through each concept, operation, and solution, explaining the 'how' and 'why' in plain English instead of math-speak. Through relevant instruction and practical examples, you'll soon learn that real-life calculus isn't nearly the monster it's made out to be.", :publication_year => '2016', :category => 'Science & Mathematics', :edition => '2nd', :search_count => 1},
    {:img => "books/9781438004976.jpg", :isbn => '9781438004976', :title => "Barron's AP Calculus", :author => 'David Bock M.S.', :publisher => "Barron's Educational Series", :summary => "Both Calculus AB and Calculus BC are covered in this comprehensive AP test preparation manual. The book's main features include: Four practice exams in Calculus AB and four more in Calculus BC, All test questions answered with solutions explained, A detailed subject review covering topics for both exams, Advice to students on efficient use of their graphing calculators, The manual can be purchased alone or with an optional CD-ROM presenting two more practice tests with answers. One test is in Calculus AB, and the other in Calculus BC.", :publication_year => '2015', :category => 'Science & Mathematics', :edition => '13th', :search_count => 2},
    {:img => "books/9780718079185.jpg", :isbn => '9780718079185', :title => "The Magnolia Story", :author => 'Chip Gaines', :publisher => "Thomas Nelson", :summary => "The Magnolia Story is the first book from Chip and Joanna, offering their fans a detailed look at their life together. From the very first renovation project they ever tackled together, to the project that nearly cost them everything; from the childhood memories that shaped them, to the twists and turns that led them to the life they share on the farm today.", :publication_year => '2016', :category => 'Arts & Literature', :edition => '1st', :search_count => 4},
    {:img => "books/9781419723445.jpg", :isbn => '9781419723445', :title => "Double Down (Diary of a Wimpy Kid #11)", :author => 'Jeff Kinney', :publisher => "Amulet Books", :summary => "The pressure’s really piling up on Greg Heffley. His mom thinks video games are turning his brain to mush, so she wants her son to put down the controller and explore his 'creative side.' As if that’s not scary enough, Halloween’s just around the corner and the frights are coming at Greg from every angle. When Greg discovers a bag of gummy worms, it sparks an idea. Can he get his mom off his back by making a movie . . . and will he become rich and famous in the process? Or will doubling down on this plan just double Greg’s troubles?", :publication_year => '2016', :category => "Children's Books", :edition => '1st', :search_count => 1},
    {:img => "books/9780439708184.jpg", :isbn => '9780439708180', :title => "Harry Potter and the Sorcerer's Stone", :author => 'J.K. Rowling', :publisher => "Pottermore", :summary => "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!", :publication_year => '2015', :category => "Children's Books", :edition => '1st', :search_count => 20},
    {:img => "books/9780439023481.jpg", :isbn => '9780439023481', :title => "The Hunger Games (Hunger Games Trilogy, Book 1)", :author => 'Suzanne Collins', :publisher => "Scholastic Press", :summary => "In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and one girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV. Sixteen-year-old Katniss Everdeen, who lives alone with her mother and younger sister, regards it as a death sentence when she is forced to represent her district in the Games. But Katniss has been close to dead and survival, for her, is second nature. Without really meaning to, she becomes a contender. But if she is to win, she will have to start making choices that weigh survival against humanity and life against love.", :publication_year => '2009', :category => "Children's Books", :edition => 'Reprint', :search_count => 5},
    {:img => "books/9780312510787.jpg", :isbn => '9780312510787', :title => "First 100 Words", :author => 'Roger Priddy', :publisher => "Priddy Books", :summary => "Your little one will soon learn some essential first words and pictures with this bright board book. There are 100 color photographs to look at and talk about, and 100 simple first words to read and learn, too. The pages are made from tough board for hours of fun reading, and the cover is softly padded for little hands to hold.", :publication_year => '2011', :category => "Children's Books", :edition => 'Reprint', :search_count => 1},
  	 ]

books.each do |book|
  Book.create!(book)
end 

Role.create!(:position => "Staff", :position_code => "Staff1")
Role.create!(:position => "Admin", :position_code => "Admin1")

User.create!(:email => "admin@gmail.com", :first_name => "Default", :last_name => "Admin", :password => "123456", :password_confirmation => "123456", :position => "Admin")
User.create!(:email => "staff@gmail.com", :first_name => "Default", :last_name => "Staff", :password => "123456", :password_confirmation => "123456", :position => "Staff")
User.create!(:email => "user1@gmail.com", :first_name => "User", :last_name => "No.1", :password => "123456", :password_confirmation => "123456", :position => "User")
User.create!(:email => "user2@gmail.com", :first_name => "User", :last_name => "No.2", :password => "123456", :password_confirmation => "123456", :position => "User")
User.create!(:email => "user3@gmail.com", :first_name => "User", :last_name => "No.3", :password => "123456", :password_confirmation => "123456", :position => "User")
User.create!(:email => "user4@gmail.com", :first_name => "User", :last_name => "No.4", :password => "123456", :password_confirmation => "123456", :position => "User")

Genres = [
  {:genre => 'Science Fiction'},
  {:genre => 'Satire'},
  {:genre =>'Drama'},
  {:genre =>'Action and Adventure'},
  {:genre =>'Romance'},
  {:genre =>'Mystery'},
  {:genre =>'Horror'},
  {:genre =>'Self help'},
  {:genre =>'Health'},
  {:genre =>'Guide'},
  {:genre =>'Travel'},
  {:genre =>'Children\'s'},
  {:genre =>'Religion, Spirituality & New Age'},
  {:genre =>'Science'},
  {:genre =>'History'},
  {:genre =>'Math'},
  {:genre =>'Anthology'},
  {:genre =>'Poetry'},
  {:genre =>'Encyclopedias'},
  {:genre =>'Dictionaries'},
  {:genre =>'Comics'},
  {:genre =>'Art'},
  {:genre =>'Cookbooks'},
  {:genre =>'Diaries'},
  {:genre =>'Journals'},
  {:genre =>'Prayer books'},
  {:genre =>'Series'},
  {:genre =>'Trilogy'},
  {:genre =>'Biographies'},
  {:genre =>'Autobiographies'},
  {:genre =>'Fantasy'}
    ]
Genres.each do |cat|
  Interest.create!(cat)
end 

# Reviews for book id 2
Review.create!(:star => 5, :comment => "Loved this whole series!!!", :book_id => 2, :user_id => 3)
Review.create!(:star => 4, :comment => "Each book in this series just gets better and better. Beautiful writing. Loved reading this", :book_id => 2, :user_id => 4)
Review.create!(:star => 4, :comment => "This book is awesome!", :book_id => 2, :user_id => 5)
# Reviews for book id 3
Review.create!(:star => 2, :comment => "A sloppy ripping-off book for students.", :book_id => 3, :user_id => 4)
# Reviews for book id 9
Review.create!(:star => 4, :comment => "What a wonderful book! The iconic first book in the Harry Potter series, it sets the tone for the wonderful wizarding adventures to come.", :book_id => 9, :user_id => 3)
Review.create!(:star => 5, :comment => "One of my favorite books ever. This is a classic, for all ages!", :book_id => 9, :user_id => 4)
Review.create!(:star => 5, :comment => "I love this series. I am reading it alot", :book_id => 9, :user_id => 5)
Review.create!(:star => 5, :comment => "Even better then the movie!", :book_id => 9, :user_id => 6)

#Follow users
Follow.create!(:follower_id => 1, :followedUser_id => 3)
Follow.create!(:follower_id => 1, :followedUser_id => 4)
Follow.create!(:follower_id => 1, :followedUser_id => 5)
Follow.create!(:follower_id => 2, :followedUser_id => 1)
Follow.create!(:follower_id => 2, :followedUser_id => 3)
Follow.create!(:follower_id => 5, :followedUser_id => 1)