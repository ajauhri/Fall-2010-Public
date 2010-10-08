class User < ActiveRecord::Base
  has_many :efforts
  acts_as_authentic
  ADMIN = 'Admin'
  ROLES = ['Developer','Manager', 'Admin']
end
