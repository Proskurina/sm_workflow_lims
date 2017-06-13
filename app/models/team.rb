class Team < ActiveRecord::Base
  has_many :team_stages, dependent: :destroy
  has_many :stages, through: :team_stages

  has_many :workfows

  attr_writer :stages_names

  def stages_names=(stages_names)
    stages_names.each do |stage_name|
      stages << Stage.find_by(name: stage_name)
    end
  end
end
