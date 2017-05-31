class AddFlowIdToExistingWorkflows < ActiveRecord::Migration
  def change
    Workflow.all.each do |workflow|
      flow = Flow.find_by(initial_state_id: workflow.initial_state_id)
      workflow.flow = flow
      workflow.save
    end
  end
end
