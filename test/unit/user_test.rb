require 'test_helper'

class UserTest < ActiveSupport::TestCase

setup :activate_authlogic
  test 'new user creation' do
    @user_one = users(:asem)
    assert @user_one.valid?
 
  end


end

