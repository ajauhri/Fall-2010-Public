require 'spec_helper'

describe Complexity do

  it "should return an array of Complexity values" do
  Complexity.getValues.should == ["LOW","MEDIUM","HIGH"]
  end
end
