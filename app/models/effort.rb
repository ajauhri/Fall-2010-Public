class Effort < ActiveRecord::Base
 belongs_to :user
 belongs_to :deliverable
 validates_presence_of :value
 validates_numericality_of :value
 validate :validify_effort

  def get_total_deliverable_effort(d_id)
    sum = 0
    for effort in Effort.find_by_deliverable_id(d_id)
      sum += effort.value
    end
  end

  private

  def validify_effort
    errors.add('', "Must select a deliverable to log effort") if deliverable_id.blank?
  end
end
