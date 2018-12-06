require_relative('../models/movie')
require_relative('../models/star')
require_relative('../models/casting')


require( 'pry-byebug' )
require( 'pry-byebug' )


Casting.delete_all()
Movie.delete_all()
Star.delete_all()


actor1 = Star.new('first_name' => 'Bobby', 'last_name' => 'Cannavale' )
actor2 = Star.new('first_name' => 'Ms', 'last_name' => 'Divine' )
actor3 = Star.new('first_name' => 'Jean Claude', 'last_name' => 'Van Damme')

actor1.save
actor2.save
actor3.save

movie1 = Movie.new('title' => 'Laurence of Arabia of Australia: Port of Call New Orleans', 'genre' => 'a good bit of fun', 'budget' => '4')
movie2 = Movie.new('title' => 'Spiders, Lice, Children of the Corn: The Revenge of Ned', 'genre' => 'children', 'budget' => '6')
movie3 = Movie.new('title' => 'Gilroy Monsanto', 'genre' => 'coming of age', 'budget' => '2')

movie1.save
movie2.save
movie3.save

casting1 = Casting.new('fee' => '3', 'movie_id' => movie1.id, 'star_id' => actor3.id)
casting2 = Casting.new('fee' => '1', 'movie_id' => movie1.id, 'star_id' => actor1.id)
casting3 = Casting.new('fee' => '4', 'movie_id' => movie2.id, 'star_id' => actor2.id)
casting4 = Casting.new('fee' => '3', 'movie_id' => movie2.id, 'star_id' => actor1.id)
casting5 = Casting.new('fee' => '2', 'movie_id' => movie2.id, 'star_id' => actor3.id)
casting6 = Casting.new('fee' => '1', 'movie_id' => movie3.id, 'star_id' => actor2.id)


casting1.save
casting2.save
casting3.save
casting4.save
casting5.save
casting6.save


binding.pry
nil
