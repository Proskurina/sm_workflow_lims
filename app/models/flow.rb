class Flow < ActiveRecord::Base
  belongs_to :initial_state, class_name: 'State'
  has_many :workflows
  validates_presence_of :name, :initial_state

  attr_accessor :initial_state_name

  def initial_state_name=(initial_state_name)
    self.initial_state = State.find_by(name: initial_state_name)
  end
end
