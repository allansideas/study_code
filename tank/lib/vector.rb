class Vector
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(value)
    if value.respond_to?(:x)
      x == value.x && y == value.y
    elsif value.respond_to?(:[])
      x == value[0] && y == value[1]
    else
      raise ArgumentError, "don't know how to compare position with #{value.inspect}"
    end
  end

  def *(scalar)
    self.class.new(x * scalar, y * scalar)
  end
end