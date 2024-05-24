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
