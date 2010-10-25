require 'spec_helper'

describe TypicalDeliverable do
  
    before(:all) do
      DeliverableType.delete_all
      @deliverable_type = DeliverableType.create!(:name => 'Requirements Document',
      :unit_of_measure => 'pages')
    end

    before(:each) do

    @valid_attributes = {
      :name => "Requirements Doc",
      :deliverable_type_id => @deliverable_type.id,
      :complexity => Complexity::VALUES[1],
      :estimated_size => 10,
      :estimated_effort => 20
    }
  end



it "should create a new instance given valid attributes" do
    TypicalDeliverable.create!(@valid_attributes)
  end

  it "should fail creating  a typical deliverable with an existing name (for the same phase)" do
    TypicalDeliverable.create(@valid_attributes)
    TypicalDeliverable.create(@valid_attributes).should be_invalid    
  end

  it "should fail with a complexity that does not exist in the complexity array" do
    typical_deliverable = TypicalDeliverable.create!(@valid_attributes)
    typical_deliverable.complexity = "blah"
    typical_deliverable.should be_invalid
  end

  it "should calculate the production rate from size and effort" do
    typical_deliverable = TypicalDeliverable.create!(@valid_attributes)
    typical_deliverable.get_production_rate.should == 2
  end

  it "should fail if effort not > 0" do
    typical_deliverable = TypicalDeliverable.create!(@valid_attributes)
    typical_deliverable.estimated_effort = -1
    typical_deliverable.should be_invalid
  end

  it "should fail if size not > 0 " do
        typical_deliverable = TypicalDeliverable.create!(@valid_attributes)
    typical_deliverable.estimated_size = -1
    typical_deliverable.should be_invalid
  end
end