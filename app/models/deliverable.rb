# == Schema Information
#
# Table name: deliverables
#
#  id                        :integer         not null, primary key
#  name                      :string(255)
#  description               :text
#  deliverable_type          :string(255)
#  unit_of_measure           :string(255)
#  complexity                :string(255)
#  estimated_size            :decimal(, )
#  estimated_effort          :decimal(, )     default(0.0)
#  estimated_production_rate :decimal(, )
#  actual_size               :decimal(, )
#  actual_effort             :decimal(, )     default(0.0)
#  actual_production_rate    :decimal(, )
#  project_phase_id          :integer
#  created_at                :datetime
#  updated_at                :datetime
#
# Model class for deliverables table. Associations => belongs_to :project_phase, has_many :efforts
class Deliverable < ActiveRecord::Base
  belongs_to :project_phase
  has_many :efforts, :dependent => :destroy
  after_save :increment_estimated_effort
  before_destroy :decrement_estimated_effort
  before_create :assign_actual_size

  validates_presence_of :name, :deliverable_type, :unit_of_measure,
  :complexity, :estimated_size, :estimated_effort, :estimated_production_rate

  validates_numericality_of :estimated_size, :estimated_effort

  validate :estimated_size_should_be_positive, :estimated_effort_should_be_positive

  validates_inclusion_of :complexity, :in => Complexity.getValues


  # To create deliverables from the set of pre-defined typical deliverables
  # Inputs parms : TypicalDeliverable.id, ProjectPhase.id
  #Retruns       : Nil
  def self.create_from_typical_deliverable(typical_deliverable_id, project_phase_id)
    @typical_deliverable = TypicalDeliverable.find(typical_deliverable_id)
    deliverable_type = DeliverableType.find(@typical_deliverable.deliverable_type_id)

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


  # To get estimates based on complexity, and deliverable
  # Inputs parms : Deliverable.id, Complexity
  # Retruns     : Hash of all estimates
  def self.get_estimates(deliverable_type, complexity)
    find_by = {:complexity => complexity, :deliverable_type => deliverable_type,
      :project_phases => {:projects => {:status => "Archived"}}}
      return get_statistics(find_by)
    end

    protected



    # Calulates estimates
    # Input params : DeliverableType.name, Complexity
    # Returns      : Hash of the estimates
    def self.get_statistics(find_by)
      estimates = {}
      estimates[:avg_effort] = Deliverable.average :actual_effort, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:max_effort] = Deliverable.maximum :actual_effort, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:min_effort] = Deliverable.minimum :actual_effort, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:avg_size] = Deliverable.average :actual_size, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:max_size] = Deliverable.maximum :actual_size, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:min_size] = Deliverable.minimum :actual_size, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:avg_rate] = Deliverable.average :actual_production_rate, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:max_rate] = Deliverable.maximum :actual_production_rate, :conditions => find_by, :joins => [:project_phase => :project]
      estimates[:min_rate] = Deliverable.minimum :actual_production_rate, :conditions => find_by, :joins => [:project_phase => :project]

      return estimates

    end

    # Ensures estimate_size is not negative

    def estimated_size_should_be_positive
      if estimated_size.nil? || estimated_size <= 0
        errors.add(:estimated_size, 'should be positive')
      end
    end

    # Ensures estimate_effort is not negative

    def estimated_effort_should_be_positive
      if estimated_effort.nil? || estimated_effort <= 0
        errors.add(:estimated_effort, 'should be positive')
      end
    end

    # Decrements Deliverable.actual_effort and calls ProjectPhase model to decrement actual_effort
    # Input params : Effort.value

    def decrement_actual_effort effort_value
      self.actual_effort -= effort_value
      self.actual_production_rate = ((self.actual_effort / self.actual_size)*100).round / 100
      if self.save! && self.project_phase
        self.project_phase.decrement_actual_effort effort_value
      end
    end
    
    
    # Increments Deliverable.actual_effort and calls ProjectPhase model to increment actual_effort
    # Input params : Effort.value

    def increment_actual_effort effort_value

      self.actual_effort += effort_value
      self.actual_production_rate = ((self.actual_effort / self.actual_size)*100).round / 100
      if self.save! && self.project_phase
        self.project_phase.increment_actual_effort effort_value
      end
    end

    # Updates efforts for ProjectPhase

    def increment_estimated_effort

      if self.estimated_effort_changed? and self.project_phase
        self.project_phase.increment_total_estimated_effort self.estimated_effort
      end

    end

    # Calls Deliverable model to decrement actual_effort
    def decrement_estimated_effort
      if self.project_phase
        self.project_phase.decrement_total_estimated_effort self.estimated_effort
      end

    end
    
    # Assigns estimated_size to actual_size
    
    def assign_actual_size
      self.actual_size = self.estimated_size
    end

  end
