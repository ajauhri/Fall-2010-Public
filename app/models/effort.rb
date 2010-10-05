class Effort < ActiveRecord::Base
 belongs_to :user
 belongs_to :deliverable
  validates_presence_of :value

  def get_total_deliverable_effort

  end

end
