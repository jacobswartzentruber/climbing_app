class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|

      t.timestamps null: false
    end
  end
end
