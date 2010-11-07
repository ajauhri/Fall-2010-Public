class CreateDeliverables < ActiveRecord::Migration
  def self.up
    create_table :deliverables do |t|
      t.string :name
      t.text :description
      t.string :deliverable_type
      t.string :unit_of_measure
      t.string :complexity
      t.decimal :estimated_size
      t.decimal :estimated_effort, :default => 0.0
      t.decimal :estimated_production_rate
      t.decimal :actual_size
      t.decimal :actual_effort, :default => 0.0
      t.decimal :actual_production_rate
      t.integer :project_phase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :deliverables
  end
end
