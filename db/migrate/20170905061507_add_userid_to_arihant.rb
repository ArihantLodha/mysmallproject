class AddUseridToArihant < ActiveRecord::Migration
  def change
  add_column :arihants, :user_id, :integer
  end
end
