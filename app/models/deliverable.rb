# Model class for deliverables table. Associations => belongs_to :project_phase, has_many :efforts
class Deliverable < ActiveRecord::Base
  belongs_to :project_phase
  has_many :efforts

  validates_presence_of :name, :deliverable_type, :unit_of_measure,
      :complexity, :estimated_size, :estimated_effort

  validates_numericality_of :estimated_size, :estimated_effort

  validate :estimated_size_should_be_positive, :estimated_effort_should_be_positive

  validates_inclusion_of :complexity, :in => Complexity::VALUES

  def get_production_rate
    #if !estimated_size.nil? && !estimated_effort.nil? && estimated_size > 0 && estimated_effort > 0
      return estimated_effort / estimated_size
    #else
    #  return 0
    #end
  end


  def self.create_from_typical_deliverable(typical_deliverable_id, project_phase_id)
    @typical_deliverable = TypicalDeliverable.find(typical_deliverable_id)
    deliverable_type = DeliverableType.find(@typical_deliverable.deliverable_type_id)

    puts "create_from_typical_deliverable ----" + @typical_deliverable.name
    if @typical_deliverable
        Deliverable.create(
         :name => @typical_deliverable.name,
         :description => @typical_deliverable.description,
         :deliverable_type => deliverable_type.name,
         :unit_of_measure => deliverable_type.unit_of_measure,
         :complexity => @typical_deliverable.complexity,
         :estimated_size => @typical_deliverable.estimated_size,
         :estimated_effort => @typical_deliverable.estimated_effort,
         :estimated_production_rate => @typical_deliverable.estimated_production_rate,
         :project_phase_id => project_phase_id)
    end
  end

  def self.get_estimates(deliverable_type, complexity)
    find_by = ["deliverable_type = ? and complexity = ?", deliverable_type, complexity]
    return get_statistics(find_by)
  end

protected

  def self.get_statistics(find_by)
    estimates = {}
    estimates[:avg_effort] = Deliverable.find(:all, :conditions => find_by).average(:actual_effort)
    estimates[:max_effort] = Deliverable.find(:all, :conditions => find_by).maximum(:actual_effort)
    estimates[:min_effort] = Deliverable.find(:all, :conditions => find_by).minimum(:actual_effort)
    estimates[:avg_size] = Deliverable.find(:all, :conditions => find_by).average(:actual_size)
    estimates[:max_size] = Deliverable.find(:all, :conditions => find_by).maximum(:actual_size)
    estimates[:min_size] = Deliverable.find(:all, :conditions => find_by).minimum(:actual_size)
    estimates[:avg_rate] = Deliverable.find(:all, :conditions => find_by).average(:actual_production_rate)
    estimates[:max_rate] = Deliverable.find(:all, :conditions => find_by).maximum(:actual_production_rate)
    estimates[:min_rate] = Deliverable.find(:all, :conditions => find_by).minimum(:actual_production_rate)
    return estimates
  end

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
