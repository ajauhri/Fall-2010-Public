class User < ActiveRecord::Base
  acts_as_authentic
  ADMIN = 'Admin'
  ROLES = ['Developer','Manager', ADMIN]
end
