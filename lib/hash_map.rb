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
      self.load += 1
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
      self.load += 1
      node.next_node = Node.new(key, value)
      resize if load / capacity >= 0.8
    end
  end

  def get(key)
    index = hash(key) % capacity
    node = data[index]
    until node.nil?
      return node.value if node.key == key

      node = node.next_node
    end
    nil
  end

  def has?(key)
    index = hash(key) % capacity
    node = data[index]
    until node.nil?
      return true if node.key == key

      node = node.next_node
    end
    false
  end

  def remove(key)
    index = hash(key) % capacity
    node = data[index]
    return nil if node.nil?

    if node.key == key
      val = node.value
      node = node.next_node
      self.load -= 1
      return val
    end
    until node.next_node.nil?
      if node.next_node.key == key
        val = node.next_node.value
        node.next_node = node.next_node.next_node
        self.load -= 1
        return val
      end
      node = node.next_node
    end
    nil
  end

  def length
    load
  end

  private

  attr_accessor :capacity, :load, :data

  def hash(key)
    hash_code = 0
    key.to_s.each_char { |char| hash_code = (PRIME * hash_code) + char.ord }
    hash_code
  end

  def resize
    old_data = data.dup
    self.capacity = capacity * 2
    self.data = Array.new(capacity)
    self.load = 0
    old_data.each do |node|
      until node.nil?
        set(node.key, node.value)
        node = node.next_node
      end
    end
  end
end
