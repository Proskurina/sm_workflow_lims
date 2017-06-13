class Stage < ActiveRecord::Base
  has_many :events
  has_many :workflows

  has_many :team_stages
  has_many :teams, through: :team_stages

  validates_presence_of :name
  validates_uniqueness_of :name

end
