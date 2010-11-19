require 'spec_helper'

describe CatalogsController do
  before(:each) do
     login_user
   end

   after(:each) do
     logout_user
   end
  

  #Delete these examples and add some real ones
  it "should use CatalogsController" do
    controller.should be_an_instance_of(CatalogsController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
