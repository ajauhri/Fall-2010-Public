require 'spec_helper'

describe Project do
  before(:each) do
    @project = Factory.build(:project)
  end

  it "should succed creating a new :project from the Factory" do
    Factory.create(:project)
  end
end