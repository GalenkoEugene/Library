# frozen_string_literal: true

require 'yaml/store'
require './classes/book'
require './classes/author'
require './classes/reader'
require './classes/order'
require './seed'
# allow import and export data to/from file, can find top(:book, :reader)
class Library
  attr_accessor :authors, :books, :readers, :orders

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def bookworm
    top(1, :reader).flatten[0].name
  end

  def bestseller
    top(1, :book).flatten[0].title
  end

  def top3_books_readers
    books = top(3, :book).to_h.keys
    @orders.select { |order| books.include? order.book }.group_by(&:reader).uniq.size
  end

  def import
    load = YAML.load_file('ledger.yaml') if File.file?('ledger.yaml')
    @authors = load.authors
    @books = load.books
    @readers = load.readers
    @orders = load.orders
  end

  private

  def top(n, object)
    @orders.group_by(&object).max_by(n) { |_, orders| orders.size }
  end
end
