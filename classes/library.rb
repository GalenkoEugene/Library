require 'yaml/store'
require 'faker'
require './classes/book'
require './classes/author'
require './classes/reader'
require './classes/order'
require './seed'
class Library
  attr_accessor :authors, :books, :readers, :orders

  def initialize(authors=[], books=[], readers=[], orders=[])
    @authors, @books, @readers, @orders = authors, books, readers, orders
  end

  def bookworm
    @orders.group_by(&:reader).max_by{ |_,orders| orders.size }[0].name
  end

  def bestseller
    @orders.group_by(&:book).max_by{ |_,orders| orders.size }[0].title
  end

  def top3_books_readers
    top3_books = @orders.group_by(&:book).max_by(3){ |_,orders| orders.size }.to_h.keys
    @orders.flat_map{ |order| order.reader if top3_books.include? order.book }.uniq.size
  end

  def import
    load = YAML.load_file('ledger.yaml') if File.file?('ledger.yaml')
    @authors = load.authors
    @books = load.books 
    @readers = load.readers
    @orders = load.orders
  end

  def generate_data
    seed_db(self)
    File.open('ledger.yaml', "w") { |f| f.write self.to_yaml }
  end
end