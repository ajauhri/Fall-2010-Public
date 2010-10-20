class CreateTypicalDeliverables < ActiveRecord::Migration
  def self.up
    create_table :typical_deliverables do |t|
      t.string :name
      t.text :description
      t.string :deliverable_type
      t.string :unit_of_measure
      t.string :complexity
      t.decimal :estimated_size
      t.decimal :estimated_effort
      t.decimal :estimated_production_rate
      t.integer :lifecycle_phase_id
      t.timestamps
    end
  end

  def self.down
    drop_table :typical_deliverables
  end
end