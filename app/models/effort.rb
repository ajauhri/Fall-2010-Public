# == Schema Information
#
# Table name: efforts
#
#  id             :integer         not null, primary key
#  value          :decimal(, )     default(0.0)
#  effort_date    :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  deliverable_id :integer
#  user_id        :integer
#
# Model class for efforts table. Associations: belongs_to :user, :deliverable
class Effort < ActiveRecord::Base
  belongs_to :user
  belongs_to :deliverable # :autosave => true
  validates_presence_of :value, :deliverable_id
  validates_numericality_of :value
  validates_uniqueness_of :user_id, :scope => :deliverable_id
  validate :validify_effort
  after_save :increment_actual_effort
  before_destroy :decrement_actual_effort
  
  private
  
  # Updates efforts in deliverable, project_phase, and project
  def increment_actual_effort
    if self.value_changed? and self.deliverable
     self.deliverable.increment_actual_effort self.value
    end
  end
  
  # Calls Deliverable model to decrement actual_effort
  def decrement_actual_effort
    if self.deliverable 
     self.deliverable.decrement_actual_effort self.value
    end
    
  end
  
    
  # Checks for the validity of a deliverable to log effort
     
  def validify_effort
    if value < 0.0
      self.value = 0.0
    end
  end
end

