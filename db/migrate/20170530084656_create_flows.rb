class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :name, null: false
      t.references :initial_state, null: false
      t.index :initial_state_id

      t.timestamps null: false
    end
  end
end
