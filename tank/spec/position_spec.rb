require 'position'

describe Position do
  describe "equality" do
    it "is equal for same position" do
      position = Position.new(10,10)
      position.should == position
    end

    #it "is equal for two positions with same coords"
    #it "is not equal for two positions with different coords"
    #it "is equal for array with same coords"
    #it "is not equal for array with different coords"
    #it "raises error if compared to type unlike a position or enumerable"
  end

  describe "move!" do
    it "can move the position in any of the four directions" do
      Position.new(10,10).move!(Vector.new(1,0)).should == Position.new(11,10)
      Position.new(20,20).move!(Vector.new(0,-1)).should == Position.new(20,19)
    end
  end
end