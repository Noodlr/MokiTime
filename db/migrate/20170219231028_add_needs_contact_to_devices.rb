class AddNeedsContactToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :needs_to_be_contacted, :boolean
  end
end
