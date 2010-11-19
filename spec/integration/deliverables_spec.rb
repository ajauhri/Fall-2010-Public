require 'spec_helper'

describe "Deliverables" do
  #fixtures :all

  before(:all) do
    

 end
 
  after(:all) do
     # before all is not transactional, need to cleanup manually
    # User.delete_all()
    #Capybara.use_default_driver
  end
 
  it "should log in" do
      Capybara.current_driver = :selenium
              Capybara.reset_sessions!
              #Factory.create(:valid_user)
              visit root_path
              #fill_in "Username", :with => "testuser@test.com"
              #fill_in "Password", :with => "testpassword"
              #click_button "Login"
            end
  end
