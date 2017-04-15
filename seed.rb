require './classes/library'
#Author = Struct.new :name, :biography
#Book = Struct.new :title, :author
#Reader = Struct.new :name, :email, :city, :street, :house
#Order = Struct.new :book, :reader, :date 
#Library = Struct.new :authors, :books, :readers, :orders

def seed_db
  authors = []
  2.times { authors << Author.new(Faker::Book.author, 
								Faker::Lorem.paragraph) }
  books = []
  4.times{ books << Book.new(Faker::Book.title,  
							authors.sample) }

  readers = []  
  3.times{ readers << Reader.new(Faker::Name.first_name,
								Faker::Internet.email,
								Faker::Address.city,
								Faker::Address.street_name,
								Faker::Address.building_number) }

  orders = [] 
  4.times{ orders << Order.new(books.sample,
							readers.sample,
							Faker::Date.between(3.year.ago, 1.day.ago)
							) }
 
  Library.new(authors, books, readers, orders)
end
