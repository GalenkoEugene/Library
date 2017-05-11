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

  def bookworm
    @readers.map { |reader| reader.name if top.include? (reader.email)}.compact.uniq[0]
  end

  def bestseller
    @books.map { |book| book.title if top("book").include? (book.title)}.compact.first
  end

  def top3_books_readers
    @orders.map { |order| order.reader.name if top("book", 3).include? (order.book.title) }.compact.uniq.size
  end

  private

  def top(target="reader", n=1)
    h=Hash.new(0)
    @orders.map do |el| 
      target=="reader" ? h[el.reader.email]+=1 : h[el.book.title]+=1 
    end
    h.sort_by { |k,v| -v }.first(n).flatten
  end

  def import
    YAML.load_file('../ledger.yaml') if File.file?('../ledger.yaml')
  end

  def generate_data

  end
end