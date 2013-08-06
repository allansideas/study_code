require 'tank'

describe Tank do
  before(:each) do
    @tank = Tank.new(Position.new(10,10), Orientation.north)
  end

  it "should be placed on a grid" do
    @tank.position.should == [10,10]
  end

 #  0
 #3   1
 #  2
  it "should rotate clockwise" do
    @tank.rotate_clockwise
    @tank.orientation.should == Orientation.east
  end

  it "should rotate anticlockwise" do
    @tank.rotate_anticlockwise
    @tank.orientation.should == Orientation.west
  end

  it "should move up if it is facing up and moving forward" do
    @tank.move_forward
    @tank.position.should == [10,11]
  end

  it "should move up if it is facing down and moving backward" do
    @tank.rotate_clockwise
    @tank.rotate_clockwise
    @tank.move_backward
    @tank.position.should == [10,11]
  end

  it "should move down if it is facing up and moving backward" do
    @tank.move_backward
    @tank.position.should == [10,9]
  end

  it "should move down if it is facing down and moving forward" do
    @tank.rotate_clockwise
    @tank.rotate_clockwise
    @tank.move_forward
    @tank.position.should == [10,9]
  end

  it "should move right if it is facing right and moving forward" do
    @tank.rotate_clockwise
    @tank.move_forward
    @tank.position.should == [11,10]
  end

  it "should move right if it is facing left and moving backward" do
    @tank.rotate_anticlockwise
    @tank.move_backward
    @tank.position.should == [11,10]
  end

  it "should move left if it is facing left and moving forward" do
    @tank.rotate_anticlockwise
    @tank.move_forward
    @tank.position.should == [9,10]
  end

  it "should move left if it is facing right and moving backward" do
    @tank.rotate_clockwise
    @tank.move_backward
    @tank.position.should == [9,10]
  end

  it "should move further if it has a higher speed" do
    @fast_tank = Tank.new(Position.new(10,10), Orientation.north, 2)
    @fast_tank.move_forward
    @fast_tank.position.should == [10,12]
  end
end
