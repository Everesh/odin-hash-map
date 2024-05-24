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
