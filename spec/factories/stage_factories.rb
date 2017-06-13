FactoryGirl.define do

  sequence :stage_name do |n|
    "stage_#{n}"
  end

  factory :stage do
    name { generate :stage_name }
    initialize_with { Stage.find_or_create_by(name: name) }
  end

end