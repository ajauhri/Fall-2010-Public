require 'spec_helper'
#require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_user = Factory.create(:valid_user)

  end

  it "should succeed creating a new :valid_user from the Factory" do
    @valid_user.should be_valid
  end

  it "should invalid :invalid_user factory" do
    Factory.build(:invalid_user).should be_invalid
  end

  it "should invalid :invalid_email factory" do
    Factory.build(:invalid_email).should be_invalid
  end

  it "should be invalid with preexisting username" do
    Factory.build(:valid_user, :username => @valid_user.username).should be_invalid
  end

  it "should be invalid with preexisting_email" do
    Factory.build(:valid_user, :email => @valid_user.email).should be_invalid
  end

  it "should invalid :nonmatching_password factory" do
    Factory.build(:nonmatching_password).should be_invalid
  end

  it "should invalid :invalid_username factory" do
    Factory.build(:invalid_username).should be_invalid
  end

end

# == Schema Information
#
# Table name: users
#
#  id                :integer         not null, primary key
#  username          :string(255)
#  email             :string(255)
#  role              :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

