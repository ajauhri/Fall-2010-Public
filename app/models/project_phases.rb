class ProjectPhases < ActiveRecord::Base
  belongs_to :project
  belongs_to :lifecycle_phase
end
