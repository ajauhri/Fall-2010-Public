# == Schema Information
#
# Table name: lifecycle_phases
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  sequence     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  lifecycle_id :integer
#
# Model class for lifecycle_phases table. Associations => belongs_to :lifecycle, has_many :project_phase, :typical_deliverables
class LifecyclePhase < ActiveRecord::Base
  belongs_to :lifecycle
  has_many :project_phases
  has_many :typical_deliverables

  validates_presence_of :name 

end


