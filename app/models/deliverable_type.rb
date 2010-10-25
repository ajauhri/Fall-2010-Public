class DeliverableType < ActiveRecord::Base
  has_many :typical_deliverables

  validates_uniqueness_of :name, :scope => :unit_of_measure
  validates_presence_of :name, :unit_of_measure
end
