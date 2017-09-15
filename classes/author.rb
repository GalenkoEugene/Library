# frozen_string_literal: true

# contein info about Author
class Author
  attr_accessor :name, :biography

  def initialize(name, biography)
    @name = name
    @biography = biography
  end
end
