require 'active_support'
require 'active_support/core_ext'
require './app/models/state'

module StateMachine

  extend ActiveSupport::Concern

  def complete
    events.create! state: 'completed' if (in_progress? || quant?)
    events.create! state: 'report_required' if reportable?
  end

  def check_volume
    events.create! state: 'quant' if volume_check?
  end

  def report
    events.create! state: 'reported' if report_required?
  end

  def current_state
    events.last.state.name.inquiry
  end

  included do
    delegate :in_progress?, :volume_check?, :quant?, :report_required?, :reported?, to: :current_state
  end

end

