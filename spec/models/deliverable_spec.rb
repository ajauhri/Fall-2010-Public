require 'spec_helper'

describe Deliverable do
  before(:each) do
    @valid_attributes = {
      :name => "UI Doc",
      :deliverable_type => "none",
      :unit_of_measure => "pages",
      :complexity => Complexity::VALUES[1],
      :estimated_size => 10,
      :estimated_effort => 20
    }
  end

  it "should create a new instance given valid attributes" do
    Deliverable.create!(@valid_attributes)
  end

  it "should fail with a complexity that does not exist in the complexity array" do
    deliverable = Deliverable.create!(@valid_attributes)
    deliverable.complexity = "blah"
    deliverable.should be_invalid
  end

  it "should calculate the production rate from size and effort" do
    deliverable = Deliverable.create!(@valid_attributes)
    deliverable.get_production_rate.should == 2
  end

  it "should fail if effort not > 0" do
    deliverable = Deliverable.create!(@valid_attributes)
    deliverable.estimated_effort = -1
    deliverable.should be_invalid
  end

  it "should fail if size not > 0 " do
        deliverable = Deliverable.create!(@valid_attributes)
    deliverable.estimated_size = -1
    deliverable.should be_invalid
  end
  
end

describe Deliverable , "from a typical deliverable and a phase" do
  before :all do
    DeliverableType.delete_all
    @deliverable_type = DeliverableType.create!(:name => 'Requirements Document1',
      :unit_of_measure => 'pages')
  end

  it "should create a deliverablie for a project phase from a typical deliverable" do
     
    typical_deliverable = TypicalDeliverable.create!(:name => 'Concept Document1', :deliverable_type_id => @deliverable_type.id,
      :estimated_size => 10, :estimated_effort => 20,
      :complexity => 'LOW')
    project_phase_id = 1

    deliverable = Deliverable.create_from_typical_deliverable(typical_deliverable.id, project_phase_id)
    deliverable.should be_valid
  end


end
