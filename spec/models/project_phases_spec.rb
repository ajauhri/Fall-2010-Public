require 'spec_helper'

describe ProjectPhase do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :sequence => 1,
      :total_estimated_effort => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    ProjectPhase.create!(@valid_attributes)
  end
end
