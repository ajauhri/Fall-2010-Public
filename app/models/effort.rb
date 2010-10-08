# Model class for efforts table. Associations: belongs_to :user, :deliverable
class Effort < ActiveRecord::Base
  belongs_to :user
  belongs_to :deliverable
  validates_presence_of :value
  validates_numericality_of :value
  validate :validify_effort
  validates_uniqueness_of :user_id, :scope => :deliverable_id

=begin
  def get_total_deliverable_effort(d_id)
    sum = 0
    for effort in Effort.find_by_deliverable_id(d_id)
      sum += effort.value
    end
  end
=end

  private
# Checks for the validity of a deliverable to log effort
  def validify_effort
    if deliverable_id.blank?
      errors.add('', "Must select a deliverable to log effort")
    end
    if value < 0
      self.value = 0
    end
  end
end
