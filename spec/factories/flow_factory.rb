FactoryGirl.define do

  factory :flow do
    name 'Test flow'
    association :initial_state, factory: :state, name: 'in_progress'

    factory :sample_management_flow do
      name 'Sample management'
      association :initial_state, factory: :state, name: 'in_progress'
    end

    factory :multi_team_quant_essential_flow do
      name 'Multi team quant essential'
      association :initial_state, factory: :state, name: 'volume_check'
    end
  end
end