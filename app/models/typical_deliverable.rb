class TypicalDeliverable < ActiveRecord::Base
 belongs_to :deliverable_type
 belongs_to :lifecycle_phase

  validates_presence_of :name, :deliverable_type_id,
      :complexity, :estimated_size, :estimated_effort

  validates_uniqueness_of :name, :scope => "lifecycle_phase_id"

  validates_numericality_of :estimated_size, :estimated_effort

  validate :estimated_size_should_be_positive, :estimated_effort_should_be_positive

  validates_inclusion_of :complexity, :in => Complexity.getValues

  def get_production_rate
    #if !estimated_size.nil? && !estimated_effort.nil? && estimated_size > 0 && estimated_effort > 0
      return estimated_effort / estimated_size
    #else
    #  return 0
    #end
  end

protected
  def estimated_size_should_be_positive
    if estimated_size.nil? || estimated_size <= 0
    errors.add(:estimated_size, 'should be positive')
    end
  end

  def estimated_effort_should_be_positive
        if estimated_effort.nil? || estimated_effort <= 0
    errors.add(:estimated_effort, 'should be positive')
    end
  end

end
