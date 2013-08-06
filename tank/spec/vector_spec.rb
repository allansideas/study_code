require 'vector'

describe Vector do
  describe 'multiplication by a scalar' do
    it "multiplies x and y" do
      (Vector.new(3,4) * 2).should == Vector.new(6,8)
    end
  end
end