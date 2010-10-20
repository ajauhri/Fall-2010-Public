# Model class for lifecycle_phases table. Associations => belongs_to :lifecycle, has_many :project_phase
class LifecyclePhase < ActiveRecord::Base
  belongs_to :lifecycle
  has_many :project_phases

end
