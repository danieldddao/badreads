# require 'spec_helper'
# require 'rails_helper'

# describe Book do
#   describe 'getting all ratings' do
#     fixtures :movies
#     it 'should return all unique ratings' do
#       result = ["G", "PG", "R"]
#       expect(Movie.all_ratings).to eq(result)
#     end
#   end
  
#   describe 'searching Tmdb by keyword' do
#     context 'with valid key' do
#       it 'should call Tmdb with title keywords' do
#         expect( Tmdb::Movie).to receive(:find).with('Inception')
#         Movie.find_in_tmdb('Inception')
#       end
#       context 'with matching-movie search term' do 
#         it 'should return a non-empty array containing keyword' do
#           fake_movies = [double("Movie")]
#           allow(fake_movies[0]).to receive(:title).and_return("Inception")
#           allow(fake_movies[0]).to receive(:release_date).and_return("2011-01-01")
#           allow(fake_movies[0]).to receive(:id).and_return(0)
#           fake_country = {"countries"=>[{"certification"=>"", "iso_3166_1"=>"US"}, {"certification"=>"PG", "iso_3166_1"=>"US"}, {"certification"=>"G", "iso_3166_1"=>"UK"}]}

#           expect( Tmdb::Movie).to receive(:find).with('Inception').and_return(fake_movies)
#           expect( Tmdb::Movie).to receive(:releases).with(0).and_return(fake_country)

#           movies = Movie.find_in_tmdb('Inception')
#           expect(movies).not_to be_empty
#           expect(movies.length).to eq(1)
#           expect(movies[0][:tmdb_id]).to eq(0)
#           expect(movies[0][:title]).to eq('Inception')
#           expect(movies[0][:release_date]).to eq('2011-01-01')
#           expect(movies[0][:rating]).to eq('PG')
#         end
#       end
#       context 'with no matching-movie search term' do 
#         it 'should return an empty array' do
#           expect( Tmdb::Movie).to receive(:find).with('Inception').and_return([])
#           expect(Movie.find_in_tmdb('Inception')).to be_empty
#         end
#       end
#     end
#     context 'with invalid key' do
#       it 'should raise InvalidKeyError if key is missing or invalid' do
#         allow(Tmdb::Movie).to receive(:find).and_raise(NoMethodError)
#         allow(Tmdb::Api).to receive(:response).and_return({'code' => '401'})
#         expect { Movie.find_in_tmdb('Inception') }.to raise_error(Movie::InvalidKeyError)
#       end
#       it 'should raise tmdb_gem_exception if key is missing or invalid and response code is not 401' do
#         allow(Tmdb::Movie).to receive(:find).and_raise(NoMethodError)
#         allow(Tmdb::Api).to receive(:response).and_return({'code' => '402'})
#         expect { Movie.find_in_tmdb('Inception') }.to raise_error(NoMethodError)
#       end
#     end
#   end
  
#   describe 'creating movies from Tmdb' do
#     fixtures :movies
#     context 'with valid key' do
#       it 'should call Tmdb detail with movie_id' do
#         expect( Tmdb::Movie).to receive(:detail).with("1")
#         Movie.create_from_tmdb("1")
#       end
#       it 'should call Tmdb releases with movie_id' do
#         allow( Tmdb::Movie).to receive(:detail).with(0).and_return({"fake_detail"=>"fake"})
#         expect( Tmdb::Movie).to receive(:releases).with(0)
#         Movie.create_from_tmdb(0)
#       end
#       context 'with matching tmdb_id' do 
#         it 'shoud add movie to the database with matching-movie search term' do 
#           init_movies =  Movie.count
#           fake_country = {"countries"=>[{"certification"=>"PG", "iso_3166_1"=>"US"}]}
#           fake_detail = {"title"=>"Inception", "overview" => "fake overview", "release_date" => "2011-01-01"}
#           allow( Tmdb::Movie).to receive(:detail).with(0).and_return(fake_detail)
#           expect( Tmdb::Movie).to receive(:releases).with(0).and_return(fake_country)

#           Movie.create_from_tmdb(0)
          
#           expect(init_movies + 1).to eq(Movie.count)
#           expect(Movie.last.title).to eq('Inception')
#           expect(Movie.last.rating).to eq('PG')
#           expect(Movie.last.description).to eq('fake overview')
#           expect(Movie.last.release_date).to eq('2011-01-01')
#         end
#       end
#       context 'with non-matching tmdb_id' do 
#         it 'should not change the database' do
#           init_movies =  Movie.count
#           Movie.create_from_tmdb('0')
#           expect(init_movies).to eq(Movie.count)
#         end
#       end
#     end
#     context 'with invalid key' do
#       it 'should raise InvalidKeyError if key is missing or invalid' do
#         allow(Tmdb::Movie).to receive(:detail).and_raise(NoMethodError)
#         allow(Tmdb::Api).to receive(:response).and_return({'code' => '401'})
#         expect { Movie.create_from_tmdb('1') }.to raise_error(Movie::InvalidKeyError)
#       end
#       it 'should raise tmdb_gem_exception if key is missing or invalid and response code is not 401' do
#         allow(Tmdb::Movie).to receive(:detail).and_raise(NoMethodError)
#         allow(Tmdb::Api).to receive(:response).and_return({'code' => '402'})
#         expect { Movie.create_from_tmdb('1') }.to raise_error(NoMethodError)
#       end
#     end
#   end
  
# end
