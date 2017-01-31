class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.references :software, foreign_key: true
      t.references :location, foreign_key: true
      t.integer :d_id
      t.datetime :last_online
      t.datetime :last_contacted
      t.string :registration_code

      t.timestamps
    end
  end
end
