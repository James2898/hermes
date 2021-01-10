class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.integer :employee_id
      t.string :shop_name
      t.integer :plan

      t.timestamps
    end
    add_index :shops, :employee_id
  end
end
