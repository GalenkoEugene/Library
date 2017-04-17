require './seed'
db_file = "ledger.yaml"

def determines(db)
  puts "'#{db.bookworm}' often takes the book"
  puts "'#{db.bestseller}' is the most popular book"
  puts "'#{db.top3_books_readers}' people ordered one of the three most popular books"
end

db = if File.file?(db_file)
  YAML.load_file(db_file)
else
  db = seed_db
  File.open(db_file, "w") { |f| f.write db.to_yaml }
  db
end

determines(db)