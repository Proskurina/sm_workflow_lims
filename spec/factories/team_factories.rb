FactoryGirl.define do

  sequence :team_name do |n|
    "team_#{n}"
  end

  factory :team do
    name { generate :team_name }
    initialize_with { Team.find_or_create_by(name: name) }

    factory :sample_management_team do
      name 'sample_management'

      after(:create) do |team|
        ['in_progress', 'report_required'].each do |stage_name|
          team.stages << Stage.find_or_create_by(name: stage_name)
        end
      end
    end

    factory :dna_team do
      name 'dna'

      after(:create) do |team|
        ['volume_check', 'quant', 'report_required'].each do |stage_name|
          team.stages << Stage.find_or_create_by(name: stage_name)
        end
      end
    end

  end
end