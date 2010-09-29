require 'spec_helper'
#require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "NewUser",
      :password => "12345678",
      :password_confirmation => "12345678",
      :email => "newuser@newuser.com",
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it "should succeed creating a new :valid_user from the Factory" do
    Factory.create(:valid_user)
  end

  it "should invalid :invalid_user factory" do
    Factory.build(:invalid_user).should be_invalid
  end

  it "should invalid :invalid_email factory" do
    Factory.build(:invalid_email).should be_invalid
  end

  it "should invalid :preexisting_username factory" do
    Factory.build(:preexisting_username).should be_invalid
  end

  it "should invalid :preexisting_email factory" do
    Factory.build(:preexisting_email).should be_invalid
  end

  it "should invalid :nonmatching_password factory" do
    Factory.build(:nonmatching_password).should be_invalid
  end

  it "should invalid :invalid_username factory" do
    Factory.build(:invalid_username).should be_invalid
  end

end
