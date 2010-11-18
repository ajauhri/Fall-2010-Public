require 'spec_helper'

describe UserMailer do

  before(:all) do
    @user = Factory.create(:email_user)
  end

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = :true
    ActionMailer::Base.deliveries = []
  end

  it "should send new password through an email" do
    UserMailer.deliver_password_reset_instructions(@user)
    ActionMailer::Base.deliveries.size.should == 1
  end

  it "should send a new email throug the user model" do
    @user.deliver_password_reset_instructions!
  end

end