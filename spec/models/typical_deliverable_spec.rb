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
      :complexity => Complexity.getValues.first,
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
# == Schema Information
#
# Table name: typical_deliverables
#
#  id                        :integer         not null, primary key
#  name                      :string(255)
#  description               :text
#  deliverable_type_id       :integer
#  complexity                :string(255)
#  estimated_size            :decimal(, )
#  estimated_effort          :decimal(, )
#  estimated_production_rate :decimal(, )
#  lifecycle_phase_id        :integer
#  created_at                :datetime
#  updated_at                :datetime
#

