class State < ActiveRecord::Base
  has_many :events
  has_many :flow_states
  has_many :flows, through: :flow_states

  validates_presence_of :name
  validates_uniqueness_of :name

end
