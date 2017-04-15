class Author
  attr_accessor :name, :biography

  def initialize(name, biography)
  	@name, @biography = name, biography
  end
end
puts "Autor class load successfully..."