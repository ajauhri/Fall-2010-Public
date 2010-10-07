class ProjectPhases < ActiveRecord::Base
  belongs_to :project
  belongs_to :lifecycle_phase
  acts_as_list
end
