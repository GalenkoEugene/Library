# frozen_string_literal: true

# contein info about Book
class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end
