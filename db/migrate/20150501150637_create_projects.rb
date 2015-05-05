class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :climber_id
      t.integer :route_id
      t.boolean :completed, default: false

      t.timestamps null: false
    end
    
    add_index :projects, :climber_id
    add_index :projects, :route_id
    add_index :projects, [:climber_id, :route_id], unique: true
  end
end
