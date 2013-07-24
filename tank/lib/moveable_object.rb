# Questions:
# Up, Down, Left, Right are too restrictive?
# naming positive negative is in terms of grid but could be up, left,
# north, south...etc not sure what is best, my thinking was in terms of
# diagonals if they appear.
#
# Thoughts on design (out of scope)
# Have a Grid object with size
# Have a Coordinate < Grid object that can be used to place things and query if 
# things are already there (collisions), out of bounds...etc
class MoveableObject
  attr_reader :x, :y, :orientation, :actor

  def initialize(x, y, orientation = 0, actor)
    @x = x
    @y = y
    @actor = actor
    @orientation = orientation
  end
 
  # These rotate methods seem like there would be a way better way of doing it
  # and making sure it never lands on 360 or goes below 0.
  def rotate_clockwise
    if orientation == 270
      @orientation = 0
    else
      @orientation += 90
    end
  end

  def rotate_anticlockwise
    if orientation == 90
      @orientation = 0
    elsif orientation == 0
      @orientation = 270
    else
      @orientation -= 90
    end
  end

  def rotate(deg)
    @orientation = deg
  end

  # This seems ugly because it assumes that the opposite is negative movement
  # which might not be clear, and also seems like a bad name.
  def positive_movement?(direction)
    if (orientation == 0 or orientation == 90) and direction == 'forward'
      true
    elsif (orientation == 180 or orientation == 270) and direction == 'backward'
      true
    else
      false
    end
  end

  def y_axis_movement?
    orientation == 0 or orientation == 180
  end

  def x_axis_movement?
    orientation == 90 or orientation == 270
  end

  # This seems ugly. not sure if should have param, or split the whole
  # bunch into move_forward and move_backward
  def move(direction)
    if positive_movement?(direction) && x_axis_movement?
      @x += actor.speed
    elsif !positive_movement?(direction) && x_axis_movement?
      @x -= actor.speed
    elsif positive_movement?(direction) && y_axis_movement?
      @y += actor.speed
    elsif !positive_movement?(direction) && y_axis_movement?
      @y -= actor.speed
    end
  end

  def log_position
    "x: #{x}, y:#{y}"
  end
end

#trying to be fancier
class Tank
  attr_reader :speed

  def initialize(speed=nil)
    @speed = speed || 1
  end
end
