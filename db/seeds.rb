# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books =  [
    {:isbn => '9780806539966', :title => 'Wizard: The Life and Times of Nikola Tesla : Biography of a Genius', :author => 'Seifer, Marc J.', :publisher => 'Citadel Pr', :summary => 'The story of one of the most prolific, independent, and iconoclastic inventors of this century . . . fascinating', :publication_year => '2016', :category => 'Science & Technology', :edition => 'Reprint'},
    {:isbn => '9780763676193', :title => 'Monsters of Men', :author => 'Patrick Ness', :publisher => 'Candlewick Press (MA)', :summary => 'As a world-ending war surges around them, Todd and Viola face monstrous decisions. The indigenous Spackle, thinking and acting as one, have mobilized to avenge their murdered people. Ruthless human leaders prepare to defend their factions at all costs, even as a convoy of new settlers approaches. And as the ceaseless Noise lays all thoughts bare, the projected will of the few threatens to overwhelm the desperate desire of the many.', :publication_year => '2014', :category => 'Adventure', :edition => '2nd'},
    {:isbn => '9781285740621', :title => 'Calculus', :author => 'James Stewart', :publisher => 'Cengage Learning', :summary => "James Stewart's CALCULUS texts are widely renowned for their mathematical precision and accuracy, clarity of exposition, and outstanding examples and problem sets. Millions of students worldwide have explored calculus through Stewart's trademark style, while instructors have turned to his approach time and time again. In the Eighth Edition of CALCULUS, Stewart continues to set the standard for the course while adding carefully revised content. The patient explanations, superb exercises, focus on problem solving, and carefully graded problem sets that have made Stewart's texts best-sellers continue to provide a strong foundation for the Eighth Edition. From the most unprepared student to the most mathematically gifted, Stewart's writing and presentation serve to enhance understanding and build confidence.", :publication_year => '2015', :category => 'Science & Mathematics', :edition => '8th'},
  	 ]

books.each do |book|
  Book.create!(book)
end