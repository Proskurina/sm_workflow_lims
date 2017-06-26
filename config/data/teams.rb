module TeamFactory
  def self.teams
    [
      {name: 'sample_management',
        procedures_attributes: [
          { state_name: 'in_progress', final_state_name: 'completed', order: 1},
          { state_name: 'report_required', final_state_name: 'reported', order: 2},
          { state_name: 'cross_charge', final_state_name: 'charged', order: 3}
        ]
      },
      {name: 'dna',
        procedures_attributes: [
          { state_name: 'volume_check', order: 1},
          { state_name: 'quant', final_state_name: 'completed', order: 2},
          { state_name: 'report_required', final_state_name: 'reported', order: 3},
          { state_name: 'cross_charge', final_state_name: 'charged', order: 4}
        ]
      }
    ]
  end

  def self.seed
    Team.create!(teams)
  end

end