class AddFlowIdToExistingWorkflows < ActiveRecord::Migration
  def change
    Workflow.all.each do |workflow|
      Flow.all.each do |flow|
        if flow.initial_state.id == workflow.initial_state_id
          workflow_flow = flow
          workflow.flow = workflow_flow
          workflow.save
          break
        end
      end
    end
  end
end
