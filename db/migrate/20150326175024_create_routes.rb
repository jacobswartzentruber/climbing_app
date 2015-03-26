class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :color
      t.string :difficulty
      t.text :description
      t.references :gym, index: true

      t.timestamps null: false
    end
    add_foreign_key :routes, :gyms
  end
end
