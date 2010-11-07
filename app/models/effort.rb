# Model class for efforts table. Associations: belongs_to :user, :deliverable
class Effort < ActiveRecord::Base
  belongs_to :user
  belongs_to :deliverable
  validates_presence_of :value, :deliverable_id
  validates_numericality_of :value
  validates_uniqueness_of :user_id, :scope => :deliverable_id
  validate :validify_effort
  after_save :update_all_effort

  
  private
  # Checks for the validity of a deliverable to log effort
  
  def update_all_effort
    if self.deliverable
      self.deliverable.value += value
      self.deliverable.project_phase.value += value
      self.deliverable.project_phase.project.value += value
    end
  end
    
    
  def validify_effort
    if value < 0.0
      self.value = 0.0
    end
  end
end
