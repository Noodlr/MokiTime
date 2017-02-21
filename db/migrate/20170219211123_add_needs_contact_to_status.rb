class AddNeedsContactToStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :needs_to_be_contacted, :boolean
  end
end
