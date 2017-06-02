class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
