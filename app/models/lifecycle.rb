# Model class for lifecycles table. Associations => has_many :projects, lifecycle_phases
class Lifecycle < ActiveRecord::Base

  has_many :projects
  has_many :lifecycle_phases
  
end
