require 'spec_helper'

##
## Uncomment the lifecycle factory at some point
##

describe Effort do
  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end

   it "should create a valid effort log" do
    Factory.build(:valid_effort).should be_valid
  end

   it "should create an invalid effort log because of a string value" do
    Factory.build(:invalid_value).should be_invalid
  end

   it "should create an invalid effort log because of a nil deliverable id" do
    Factory.build(:invalid_deliverable).should be_invalid
  end

end
