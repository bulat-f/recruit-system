class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :zip_code
      t.string :state
      t.float  :latitude
      t.float  :longitude

      t.timestamps
    end
  end
end
