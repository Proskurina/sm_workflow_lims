class Flow < ActiveRecord::Base

  has_many :workflows
  validates_presence_of :name

  has_many :flow_states
  has_many :states, through: :flow_states

  attr_accessor :states_names

  def states_names=(states_names)
    states_names.each do |state_name|
      states << State.find_by(name: state_name)
    end
  end

  def initial_state
    states.first
  end
end
