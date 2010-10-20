# Model class for deliverables table. Associations => belongs_to :project_phase, has_many :efforts
class Deliverable < ActiveRecord::Base
  belongs_to :project_phase
  has_many :efforts

  validates_presence_of :name, :deliverable_type, :unit_of_measure,
      :complexity, :estimated_size, :estimated_production_rate
end
