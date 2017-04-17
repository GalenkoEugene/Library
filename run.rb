require './seed'
#store = YAML::Store.new "ledger.yaml" # Create or Load 

def determines(db)
  puts "'#{db.bookworm}' often takes the book"
  puts "'#{db.bestseller}' is the most popular book"
  puts "'#{db.top3_reader_quantity}' people ordered one of the three most popular books"
end

db = if File.file?("ledger.yaml")
  YAML.load_file('ledger.yaml')
else
  db = seed_db
  File.open("ledger.yaml", "w") { |f| f.write db.to_yaml }
  db
end
#puts db.orders.inspect
db = YAML.load_file('ledger.yaml')

determines(db)