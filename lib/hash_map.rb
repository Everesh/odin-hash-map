class HashMap
  PRIME = 53

  def initialize
    @capacity = 16
    @load = 0
    @data = []
  end

  private

  attr_accessor :capacity, :load, :data
end
