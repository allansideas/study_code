require 'orientation'

describe Orientation do
  describe "#unit_vector" do
    it "provides a vector facing north" do
      Orientation.north.unit_vector.should == [0,1]   # 0
    end
    it "provides a vector facing east" do
      Orientation.east.unit_vector.should == [1,0]   # 1
    end
    it "provides a vector facing south" do
      Orientation.south.unit_vector.should == [0,-1]  # 2
    end
    it "provides a vector facing west" do
      Orientation.west.unit_vector.should == [-1,0]  # 3
    end
  end

  describe "#reversed" do
    it "provides the opposite of the orientation" do
      Orientation.north.reversed.should == Orientation.south
      Orientation.east.reversed.should == Orientation.west
      Orientation.south.reversed.should == Orientation.north
      Orientation.west.reversed.should == Orientation.east
    end
  end
end