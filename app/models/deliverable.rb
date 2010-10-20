# Model class for deliverables table. Associations => belongs_to :project_phase, has_many :efforts
class Deliverable < ActiveRecord::Base
  belongs_to :project_phase
  has_many :efforts

  validates_presence_of :name, :deliverable_type, :unit_of_measure,
      :complexity, :estimated_size, :estimated_production_rate


  def self.create_from_typical_deliverable(typical_deliverable_id, project_phase)
    @typical_deliverable = TypicalDeliverable.find(typical_deliverable_id)

    if @typical_deliverable
        create(
         :name => @typical_deliverable.name,
         :description => @typical_deliverable.description,
         :deliverable_type => @typical_deliverable.deliverable_type,
         :unit_of_measure => @typical_deliverable.unit_of_measure,
         :complexity => @typical_deliverable.complexity,
         :estimated_size => @typical_deliverable.estimated_size,
         :estimated_effort => @typical_deliverable.estimated_effort,
         :estimated_production => @typical_deliverable.estimated_production_rate,
         :project_phase => project_phase)
    end
  end
end
