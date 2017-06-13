class CreateTeamStages < ActiveRecord::Migration
  def change
    create_table :team_stages do |t|

      t.timestamps null: false
      t.belongs_to :team, index: true
      t.belongs_to :stage, index: true
    end
  end
end
