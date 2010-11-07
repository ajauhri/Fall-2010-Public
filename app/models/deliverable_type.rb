# == Schema Information
#
# Table name: deliverable_types
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  unit_of_measure :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
# Model class for deliverable_types table. Associations => has_many :typical_deliverables

class DeliverableType < ActiveRecord::Base
  has_many :typical_deliverables

  validates_uniqueness_of :name, :scope => :unit_of_measure
  validates_presence_of :name, :unit_of_measure
end

