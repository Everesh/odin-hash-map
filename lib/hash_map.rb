require_relative 'node'

class HashMap
  PRIME = 53

  def initialize
    @capacity = 16
    @load = 0
    @data = Array.new(16)
  end

  def set(key, value)
    index = hash(key) % capacity
    if data[index].nil?
      data[index] = Node.new(key, value)
    else
      node = data[index]
      loop do
        if node.key == key
          node.value = value
          return
        end
        break if node.next_node.nil?

        node = node.next_node
      end
      node.next_node = Node.new(key, value)
    end
  end

  private

  attr_accessor :capacity, :load, :data

  def hash(key)
    hash_code = 0
    key.each_char { |char| hash_code = (PRIME * hash_code) + char.ord }
    hash_code
  end
end
