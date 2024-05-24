require_relative '../lib/hash_map'

hash = HashMap.new

begin
  hash.set('dog', 'bark')
  hash.set('cat', 'meow')
rescue
  puts 'Something went wrong setting new keys'
end

begin
  hash.set('dog', 'woof')
  hash.set('cat', 'nya')
rescue
  puts 'Something went wrong updating existing keys'
end

begin
  raise Error unless hash.get('dog') == 'woof'
  raise Error unless hash.get('cat') == 'nya'
  raise Error unless hash.get('bird').nil?
rescue
  puts 'Something went wrong getting values from keys'
end

begin
  raise Error unless hash.has?('dog')
  raise Error unless hash.has?('cat')
  raise Error if hash.has?('bird')
rescue
  puts 'Something went wrong checking for existance of keys'
end

begin
  # lets force the hash to resize
  16.times { |num| hash.set(num, num) }
rescue
  puts 'Oh nyooo, resizing went BOOOOOM! ;.;'
end

begin
  raise Error unless hash.remove(2) == 2
  raise Error unless hash.remove(5) == 5
  raise Error unless hash.remove(7) == 7
  raise Error unless hash.remove(1) == 1
  raise Error unless hash.remove(0).zero?
  raise Error unless hash.remove(15) == 15
  raise Error unless hash.remove(20).nil?
rescue
  puts 'Something went wrong removing from the hash ;.;'
end

begin
  raise Error unless hash.length == 12
rescue
  puts 'Fetching length went wrong... HOW?!?'
end

begin
  keys = hash.keys
  ['dog', 'cat', 3, 4, 6, 8, 9, 10, 11, 12, 13, 14].each do |item|
    raise Error unless keys.include?(item)
  end
rescue
  puts 'Something went wrong getting keys'
end

# Preped all future test here

begin
  hash.clear
  raise Error unless hash.length.zero?
  raise Error if hash.has?('cat')
rescue
  puts 'Clear failed!'
end
