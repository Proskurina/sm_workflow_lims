require './config/data/flows'

class SeedFlows < ActiveRecord::Migration
  def up
    FlowFactory.seed if Flow.all.empty?
  end

  def down
    Flow.destroy_all
  end
end
