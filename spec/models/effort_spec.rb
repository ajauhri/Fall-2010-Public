require 'spec_helper'

describe Effort do
  before(:each) do
    @valid_attributes = {
      :value => 1.5,
      :username => "value for username"
    }
  end

  it "should create a new instance given valid attributes" do
    Effort.create!(@valid_attributes)
  end
end
