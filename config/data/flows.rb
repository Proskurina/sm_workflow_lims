module FlowFactory

  def self.flows
    [
      {name: 'Sample management', states_names: ['in_progress', 'report_required']},
      {name: 'Multi team quant essential', states_names: ['volume_check', 'quant', 'report_required']}
    ]
  end

  def self.seed
    Flow.create!(flows)
  end

end