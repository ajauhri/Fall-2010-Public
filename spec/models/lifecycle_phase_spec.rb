require 'spec_helper'

describe LifecyclePhase do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :sequence => 1
    }
  end

  it "should create a new instance given valid attributes" do
    LifecyclePhase.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: lifecycle_phases
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  sequence     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  lifecycle_id :integer
#

