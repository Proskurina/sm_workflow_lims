module FlowFactory

  def self.flows
    [
      {name: 'Sample management',            initial_state_name: 'in_progress' },
      {name: 'Multi team quant essential',   initial_state_name: 'volume_check'}
    ]
  end

  def self.seed
    Flow.create!(flows)
  end

end