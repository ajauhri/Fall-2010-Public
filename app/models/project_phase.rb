class ProjectPhase < ActiveRecord::Base
  belongs_to :project
  belongs_to :lifecycle_phase
  has_many :deliverables
  acts_as_list :column=> :sequence#, :scope => "project_id = #{:project_id}"

  def scope_condition
    "#{connection.quote_column_name("project_id")} = #{quote_value(project_id)}" #+ :project
  end

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
end
