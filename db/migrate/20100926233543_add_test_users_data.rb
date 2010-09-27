class AddTestUsersData < ActiveRecord::Migration
  def self.up
    User.delete_all
    User.create(:username => 'rob', :email => 'rob.engel@sv.cmu.edu', :password => 'test', :password_confirmation => 'test')
    User.create(:username => 'asem', :email => 'asem.radhwi@sv.cmu.edu', :password => 'asem', :password_confirmation => 'asem')
    User.create(:username => 'inti', :email => 'inti.soto@sv.cmu.edu', :password => 'inti', :password_confirmation => 'inti')
    User.create(:username => 'abhinav', :email => 'abhinav.jauhri@sv.cmu.edu', :password => 'abhinav', :password_confirmation => 'abhinav')
  end

  def self.down
    User.delete_all
  end
end
