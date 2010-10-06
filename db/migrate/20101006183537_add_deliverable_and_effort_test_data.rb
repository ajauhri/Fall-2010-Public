class AddDeliverableAndEffortTestData < ActiveRecord::Migration
  def self.up
    Effort.delete_all
    Deliverable.delete_all
    d1 = Deliverable.create(:name => "Deliverable 1", :est_effort => 17)
    asem_id     = User.find_by_username('asem').id
    rob_id      = User.find_by_username('rob').id
    abhinav_id  = User.find_by_username('abhinav').id
    inti_id     = User.find_by_username('inti').id
    Effort.create(:user_id => asem_id, :deliverable_id => d1.id, :value => 5.0)
    Effort.create(:user_id => rob_id, :deliverable_id => d1.id, :value => 6.0)
    Effort.create(:user_id => abhinav_id, :deliverable_id => d1.id, :value => 7.0)
    Effort.create(:user_id => inti_id, :deliverable_id => d1.id, :value => 8.0)
  end

  def self.down
    Effort.delete_all
    Deliverable.delete_all
  end
end
