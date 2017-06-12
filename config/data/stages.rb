module StageFactory
  def self.stages
    [
      {name: 'in_progress'},
      {name: 'volume_check'},
      {name: 'quant'},
      {name: 'completed'},
      {name: 'report_required'},
      {name: 'reported'}
    ]
  end

  def self.seed
    Stage.create!(stages)
  end

end