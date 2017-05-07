class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string  :zip_code, null: false
      t.integer :radius,   null: false
      t.text    :message,  null: false
      t.string  :type

      t.timestamps
    end
  end
end
