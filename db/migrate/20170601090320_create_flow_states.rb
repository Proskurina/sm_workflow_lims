class CreateFlowStates < ActiveRecord::Migration
  def change
    create_table :flow_states do |t|
      t.references :state, index: true, foreign_key: true
      t.references :flow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
