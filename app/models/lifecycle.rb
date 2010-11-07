# == Schema Information
#
# Table name: lifecycles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
# Model class for lifecycles table. Associations => has_many :projects, lifecycle_phases
class Lifecycle < ActiveRecord::Base

  has_many :projects
  has_many :lifecycle_phases
  
end


