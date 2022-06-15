class AddUseridToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :Userid, :integer
  end
end
