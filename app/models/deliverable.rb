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
    find_by = ["deliverable_type like ? and complexity like ?", deliverable_type, complexity]
    return get_statistics(find_by)
  end

protected

  def self.get_statistics(find_by)
    estimates = {}
  
            estimates[:avg_effort] = Integer(Deliverable.average :actual_effort, :conditions => find_by)
            estimates[:max_effort] = Integer(Deliverable.maximum :actual_effort, :conditions => find_by)
            estimates[:min_effort] = Integer(Deliverable.minimum :actual_effort, :conditions => find_by)
            estimates[:avg_size] = Integer(Deliverable.average :actual_size, :conditions => find_by)
            estimates[:max_size] = Integer(Deliverable.maximum :actual_size, :conditions => find_by)
            estimates[:min_size] = Integer(Deliverable.minimum :actual_size, :conditions => find_by)
            estimates[:avg_rate] = Integer(Deliverable.average :actual_production_rate, :conditions => find_by)
            estimates[:max_rate] = Integer(Deliverable.maximum :actual_production_rate, :conditions => find_by)
            estimates[:min_rate] = Integer(Deliverable.minimum :actual_production_rate, :conditions => find_by)
                 
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
