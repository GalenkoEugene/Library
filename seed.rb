require './classes/library'
require 'active_support/time'

def seed_db(library)
  authors = []
  7.times { authors << Author.new(Faker::Book.unique.author, 
                                  Faker::Lorem.paragraph) }
  books = []
  22.times{ books << Book.new(Faker::Book.unique.title,  
                              authors.sample) }

  readers = []  
  6.times{ readers << Reader.new(Faker::Name.first_name,
                                 Faker::Internet.unique.email,
                                 Faker::Address.city,
                                 Faker::Address.street_name,
                                 Faker::Address.building_number) }

  orders = [] 
  36.times{ orders << Order.new(books.sample,
                                readers.sample,
                                Faker::Date.between(3.year.ago, 1.day.ago)
                                ) }
  library.authors = authors
  library.books = books
  library.readers = readers
  library.orders = orders
end
