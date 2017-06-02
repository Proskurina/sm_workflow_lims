FactoryGirl.define do

  factory :flow do
    name 'Test flow'
    initialize_with { Flow.find_or_create_by(name: name) }

    factory :sample_management_flow do
      name 'Sample management'
      after(:create) do |flow|
        unless flow.states.present?
          flow.states << State.find_or_create_by(name: 'in_progress')
          flow.states << State.find_or_create_by(name: 'report_required')
        end
      end
    end

    factory :multi_team_quant_essential_flow do
      name 'Multi team quant essential'
      after(:create) do |flow|
        unless flow.states.present?
          flow.states << State.find_or_create_by(name: 'volume_check')
          flow.states << State.find_or_create_by(name: 'quant')
          flow.states << State.find_or_create_by(name: 'report_required')
        end
      end
    end

  end
end