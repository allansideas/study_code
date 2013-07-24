require 'moveable_object'
describe MoveableObject do
  before(:each) do
    @tank = MoveableObject.new(10, 10, 0, Tank.new())
  end

  it "should be placed on a grid" do
    @tank.x.should == 10
    @tank.y.should == 10
  end

  it "should rotate clockwise" do
    @tank.rotate_clockwise
    @tank.orientation.should == 90
  end

  it "should rotate anticlockwise" do
    @tank.rotate_anticlockwise
    @tank.orientation.should == 270
  end

  it "should move up if it is facing up and moving forward" do
    @tank.move('forward')
    @tank.x.should == 10
    @tank.y.should == 11
  end

  it "should move up if it is facing down and moving backward" do
    @tank.rotate_clockwise
    @tank.rotate_clockwise
    @tank.move('backward')
    @tank.x.should == 10
    @tank.y.should == 11
  end

  it "should move down if it is facing up and moving backward" do
    @tank.move('backward')
    @tank.x.should == 10
    @tank.y.should == 9
  end

  it "should move down if it is facing down and moving forward" do
    @tank.rotate_clockwise
    @tank.rotate_clockwise
    @tank.move('forward')
    @tank.x.should == 10
    @tank.y.should == 9
  end

  it "should move right if it is facing right and moving forward" do
    @tank.rotate_clockwise
    @tank.move('forward')
    @tank.x.should == 11
    @tank.y.should == 10
  end

  it "should move right if it is facing left and moving backward" do
    @tank.rotate_anticlockwise
    @tank.move('backward')
    @tank.x.should == 11
    @tank.y.should == 10
  end

  it "should move left if it is facing left and moving forward" do
    @tank.rotate_anticlockwise
    @tank.move('forward')
    @tank.x.should == 9
    @tank.y.should == 10
  end

  it "should move left if it is facing right and moving backward" do
    @tank.rotate_clockwise
    @tank.move('backward')
    @tank.x.should == 9
    @tank.y.should == 10
  end

  it "should move further if it has a higher speed" do
    @fast_tank = MoveableObject.new(10, 10, 0, Tank.new(2))
    @fast_tank.move('forward')
    @fast_tank.x.should == 10
    @fast_tank.y.should == 12
  end
end
