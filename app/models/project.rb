# == Schema Information
#
# Table name: projects
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  description            :text
#  total_estimated_effort :decimal(, )     default(0.0)
#  status                 :string(255)     default("Active")
#  actual_effort          :decimal(, )     default(0.0)
#  created_at             :datetime
#  updated_at             :datetime
#  lifecycle_id           :integer
#
# Model class for projects table. Associations => belongs_to :lifecycle, has_many :project_phases
class Project < ActiveRecord::Base
  after_create :create_phases
  belongs_to :lifecyle
  has_many :project_phases, :order => "sequence", :dependent => :destroy
  validates_presence_of :name, :lifecycle_id

  accepts_nested_attributes_for :project_phases

  STATUS_TYPES = [
    ["Active"], #"active"],
    ["Archived"] #"archived"],
  ]

  # For automatically inserting (at the time of creation of a new project) all pre-defined phases from LifecyclePhase


  def create_phases
    @lifecycle_phases = LifecyclePhase.find_all_by_lifecycle_id(self.lifecycle_id)
    @lifecycle_phases.each do |lp|
     ProjectPhase.create_from_lifecycle_phase(lp.id, self)
    end
  end
 
  # Decrements Project.actual_effort
  # Input params : Effort.value
 
  def decrement_actual_effort effort_value
    self.actual_effort -= effort_value
    self.save!
  end
  
  # Increments Project.actual_effort
  # Input params : Effort.value

  def increment_actual_effort effort_value
    self.actual_effort +=effort_value
    self.save!
  end
  
  # Increments Project.total_estimated_effort
  # Input params : Deliverable.estimated_effort
  

  def increment_total_estimated_effort estimated_effort
    self.total_estimated_effort += estimated_effort
    self.save!
  end
  
  
  # Decrements Project.total_estimated_effort
  # Input params : Deliverable.estimated_effort
  
  def decrement_total_estimated_effort estimated_effort
    self.total_estimated_effort -= estimated_effort
    self.save!
  end


  #validates_inclusion_of :status, :in =>
  #  STATUS_TYPES.map{|disp, value| value}
end

