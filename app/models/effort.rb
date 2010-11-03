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
    self.deliverable.value = value
    # self.deliverable.project_phase.update(:value => value)
    #     self.deliverable.project_phase.project.update(:value => value)
  end
    
    
  def validify_effort
    puts "ewwetrrr"
    if value < 0.0
      self.value = 0.0
    end
  end
end
