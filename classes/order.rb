# frozen_string_literal: true

# contein info about Order
class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end
end
