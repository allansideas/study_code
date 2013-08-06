require 'vector'

class Position < Vector
  def move!(change)
    @x += change.x
    @y += change.y
    self
  end
end