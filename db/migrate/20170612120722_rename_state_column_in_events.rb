class RenameStateColumnInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :state_id, :stage_id
  end
end
