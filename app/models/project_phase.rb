# Model class for project_phases table, Associations => belongs_to :project, :lifecycle_phase, has_many :deliverables
class ProjectPhase < ActiveRecord::Base
  after_create :create_deliverables

  belongs_to :project
  belongs_to :lifecycle_phase
  has_many :deliverables
  acts_as_list :column=> :sequence#, :scope => "project_id = #{:project_id}"

  #For defining the scope for acts_as_list method

  def scope_condition
    "#{connection.quote_column_name("project_id")} = #{quote_value(project_id)}" #+ :project
  end

  # For automatically inserting (at the time of creation of a new project) all pre-defined phases from LifecyclePhase
  def self.create_from_lifecycle_phase(lifecycle_phase_id, project)
    @lifecycle_phase = LifecyclePhase.find(lifecycle_phase_id)

    if @lifecycle_phase
        create(
         :name => @lifecycle_phase.name,
         :description => @lifecycle_phase.description,
         :lifecycle_phase => @lifecycle_phase,
         :sequence => @lifecycle_phase.sequence,
         :project => project)
    end
  end

  def create_deliverables
    @typical_deliverables = TypicalDeliverable.find_all_by_lifecycle_phase_id(self.lifecycle_phase_id)
    @typical_deliverables.each do |td|
      Deliverable.create_from_typical_deliverable(td.id, self.id)
    end
  end
end
