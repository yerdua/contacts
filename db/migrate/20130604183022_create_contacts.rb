class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.string :address

      t.timestamps
    end
  end
end
