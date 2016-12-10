require_relative 'book.rb'
require_relative 'order.rb'
require_relative 'author.rb'
require_relative 'reader.rb'
require 'yaml'

class Library
  
  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end

  def save_library(file)
    File.open(file, "w") {|file| file.puts(self.to_yaml) }
  end

  def load_library(file)
    data = File.open(file) {|file| YAML::load(file)}
    @books = data.books
    @readers = data.readers
    @orders = data.orders
    @authors = data.authors
  end

  def most_popular_of(arg, n = 1)
    @orders.group_by {|orders| orders.send(arg)}
    .sort_by { |name, orders| orders.size }
    .reverse.first(n) 
  end

  def show_popular_books
    most_popular_of('book').map(&:first)
  end

  def show_popular_readers
    most_popular_of('reader').map(&:first)
  end

  def readers_who_ordered_popular_books
   most_popular_of('book', 3).map {|book, order| order}.flatten.map(&:reader).uniq.size
  end
end