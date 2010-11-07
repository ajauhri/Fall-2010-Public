require 'spec_helper'

describe DeliverableType do
  before(:each) do
    @valid_attributes = {
      :name => 'Requirements Document',
      :unit_of_measure => 'pages'
    }
    DeliverableType.delete_all
  end

  it "should create a new instance given valid attributes" do
    DeliverableType.create!(@valid_attributes)
  end

  it "should fail when create a deliverable type with an existing name" do
    DeliverableType.create!(@valid_attributes)
    DeliverableType.create(@valid_attributes).should be_invalid
  end

  it "should succeed when creating a deliverable with the same name but different measure" do
    d = DeliverableType.create!(@valid_attributes)
    d.unit_of_measure = 'diagrams'
    d.save
    DeliverableType.create(@valid_attributes).should be_valid
  end
  
  it "should fail creating an empty deliverable type" do
    DeliverableType.create(:name => nil, :unit_of_measure  => "").should be_invalid
  end
end

# == Schema Information
#
# Table name: deliverable_types
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  unit_of_measure :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

