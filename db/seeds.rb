require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = 'http://tmdb.lewagon.com/movie/top_rated'
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = 'https://image.tmdb.org/t/p/original'
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts 'Movies created'


file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
list = List.new(title: 'NES', body: "A great console")
list.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
