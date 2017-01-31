class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :phone
      t.string :state
      t.string :zip
      t.references :company, foreign_key: true
      t.string :region_name
      t.string :district_name

      t.timestamps
    end
  end
end
