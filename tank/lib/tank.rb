require 'position'
require 'orientation'
require 'active_support/core_ext/module/delegation'

class Tank
  attr_reader :orientation, :speed, :position

  def initialize(position, orientation = 0, speed = 1)
    @position = position
    @speed = speed
    @orientation = orientation
  end

  delegate :rotate_clockwise, :rotate_anticlockwise, to: :orientation

  def move_forward
    move!(orientation)
  end

  def move_backward
    move!(orientation.reversed)
  end

  private

  def move!(orientation_to_move)
    @position.move!(orientation_to_move.unit_vector * speed)
  end
end