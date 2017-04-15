require 'yaml/store'
require 'faker'
require 'active_support/time'
require './classes/book'
require './classes/author'
require './classes/reader'
require './classes/order'

class Library
  attr_accessor :authors, :books, :readers, :orders

  def initialize(authors, books, readers, orders)
  	@authors, @books, @readers, @orders = authors, books, readers, orders
  end

  def bookworm(db)
  end

  def bestseller(db)
  end
  
  def top3_reader_quantity(db)
  end
end 

puts "Library class load successfully..."