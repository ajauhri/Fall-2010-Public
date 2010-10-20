require 'spec_helper'

describe Deliverable do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :estimated_effort => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    Deliverable.create!(@valid_attributes)
  end
end
