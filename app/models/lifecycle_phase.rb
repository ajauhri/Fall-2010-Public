# Model class for lifecycle_phases table. Associations => belongs_to :lifecycle, has_many :project_phase, :typical_deliverables
class LifecyclePhase < ActiveRecord::Base
  belongs_to :lifecycle
  has_many :project_phases
  has_many :typical_deliverables

end
