class Orientation
  class << self
    def north
      new(0)
    end
    def east
      new(1)
    end
    def south
      new(2)
    end
    def west
      new(3)
    end
  end

  def initialize(index)
    @index = index
  end

  def +(value)
    self.class.new(@index + value)
  end

  def ==(value)
    if value.is_a?(Orientation)
      @index == value.index
    else
      @index == value
    end
  end

  def rotate_clockwise
    if @index == 3
      @index = 0
    else
      @index += 1
    end
  end

  def rotate_anticlockwise
    if @index == 0
      @index = 3
    else
      @index -= 1
    end
  end

  VECTORS = [[0,1], [1,0], [0,-1], [-1,0]]
  def unit_vector
    Vector.new(*VECTORS[index])
  end

  def reversed
    new_index = index + 2
    new_index -= 4 if new_index > 3
    self.class.new(new_index)
  end

  protected

  def index
    @index
  end
end