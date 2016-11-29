require_relative 'library'

my_library = Library.new
my_library.load_library('data.yaml')

puts "What is the most popular book: #{my_library.show_popular_books}"
puts "Who often takes the book: #{my_library.show_popular_readers}"
puts "How many people ordered one of three most popular books: #{my_library.readers_who_ordered_popular_books}"