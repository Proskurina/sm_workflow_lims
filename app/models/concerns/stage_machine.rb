
module StageMachine

  extend ActiveSupport::Concern

  included do
    delegate :in_progress?, :volume_check?, :quant?, :report_required?, :reported?, to: :current_stage
  end

  StageMachineError = Class.new(StandardError)

  VALID_ACTIONS = ['check_volume', 'complete', 'report']

  def perform_action(action)
    if VALID_ACTIONS.include? action
      send(action)
    else
      raise StageMachineError, "#{action} is not a recognised action"
    end
  end

  def complete
    events.create! stage_name: 'completed' if (in_progress? || quant?)
    events.create! stage_name: 'report_required' if reportable?
  end

  def check_volume
    events.create! stage_name: 'quant' if volume_check?
  end

  def report
    events.create! stage_name: 'reported' if report_required?
  end

  def current_stage
    events.last.stage.name.inquiry
  end

end
