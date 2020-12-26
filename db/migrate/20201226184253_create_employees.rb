class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.integer :shop_id
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.string :address
      t.string :email, :unique => true
      t.integer :employee_type

      t.timestamps
    end
    add_index :employees, :shop_id
  end
end
