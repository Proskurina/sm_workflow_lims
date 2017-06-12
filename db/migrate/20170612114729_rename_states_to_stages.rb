class RenameStatesToStages < ActiveRecord::Migration
  def change
    rename_table :states, :stages
  end
end
