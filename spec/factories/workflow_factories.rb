FactoryGirl.define do

  sequence :workflow_name do |n|
    "Workflow #{n}"
  end

  factory :workflow do
    name { generate :workflow_name }
    association :initial_stage, factory: :stage, name: 'in_progress'
    association :team, factory: :sample_management_team

    trait :has_comment do
      has_comment true
    end

    trait :reportable do
      reportable true
    end

    factory :workflow_reportable, traits: [:reportable]
    factory :workflow_with_comment, traits: [:has_comment]

    factory :dna_workflow do

      association :initial_stage, factory: :stage, name: 'volume_check'
      association :team, factory: :dna_team
      factory :dna_workflow_reportable, traits: [:reportable]

    end
  end

end