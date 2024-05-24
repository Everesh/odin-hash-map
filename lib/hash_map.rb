class HashMap
  PRIME = 53

  def initialize
    @capacity = 16
    @load = 0
    @data = []
  end

  private

  attr_accessor :capacity, :load, :data

  def hash(key)
    hash_code = 0
    key.each_char { |char| hash_code = (PRIME * hash_code) + char.ord }
    hash_code
  end
end
