class CreateCleaners < ActiveRecord::Migration[5.1]
  def change
    create_table :cleaners do |t|
      t.string     :name,          null: false
      t.string     :phone,         null: false
      t.references :home_location
      t.references :work_location

      t.timestamps
    end

    add_index :cleaners, :phone, unique: true
  end
end
