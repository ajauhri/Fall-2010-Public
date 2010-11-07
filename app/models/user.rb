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
# Model class for users table. Associations => has_many :efforts
class User < ActiveRecord::Base
  has_many :efforts
  acts_as_authentic
  ADMIN = 'Admin'
  ROLES = ['Developer','Manager', 'Admin']
end

