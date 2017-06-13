module TeamFactory
  def self.teams
    [
      {name: 'sample_management', stages_names: ['in_progress', 'report_required']},
      {name: 'dna', stages_names: ['volume_check', 'quant', 'report_required']}
    ]
  end

  def self.seed
    Team.create!(teams)
  end

end