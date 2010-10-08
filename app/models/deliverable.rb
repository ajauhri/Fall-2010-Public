# Model class for deliverables table. Associations => belongs_to :project_phase, has_many :efforts
class Deliverable < ActiveRecord::Base
  belongs_to :project_phase
  has_many :efforts
end
