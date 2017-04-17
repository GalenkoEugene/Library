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
    @orders.map { |order| order.reader.name if top_readers.include? (order.reader.email)}.compact.uniq[0]
  end

  def bestseller
  	@orders.map { |order| order.book.title if top_books.include? (order.book.title)}.compact.first
  end

  def top3_reader_quantity
  	@orders.map { |order| order.reader.name if top_books(3).include? (order.book.title) }.compact.uniq.size
  end

  public
  def top_readers(amount=1)
  	h=Hash.new(0)
  	@orders.map { |el| h[el.reader.email]+=1 }
    h.max_by{|k,v| v}
    h.sort_by { |k,v| -v }[0..amount-1].flatten
  end

  def top_books(amount=1)
  	h=Hash.new(0)
  	@orders.map { |el| h[el.book.title]+=1 }
    h.max_by{|k,v| v}
    h.sort_by { |k,v| -v }[0..amount-1].flatten
  end
end 