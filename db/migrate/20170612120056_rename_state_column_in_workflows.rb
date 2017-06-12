class RenameStateColumnInWorkflows < ActiveRecord::Migration
  def change
    rename_column :workflows, :initial_state_id, :initial_stage_id
  end
end
