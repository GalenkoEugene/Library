require './classes/library'

def seed_db
  authors = []
  7.times { authors << Author.new(Faker::Book.author, 
								Faker::Lorem.paragraph) }
  books = []
  22.times{ books << Book.new(Faker::Book.title,  
							authors.sample) }

  readers = []  
  6.times{ readers << Reader.new(Faker::Name.first_name,
								Faker::Internet.email,
								Faker::Address.city,
								Faker::Address.street_name,
								Faker::Address.building_number) }

  orders = [] 
  36.times{ orders << Order.new(books.sample,
							readers.sample,
							Faker::Date.between(3.year.ago, 1.day.ago)
							) }
 
  Library.new(authors, books, readers, orders)
end
