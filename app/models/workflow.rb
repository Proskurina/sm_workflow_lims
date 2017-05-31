class Workflow < ActiveRecord::Base

  has_many :assets
  # belongs_to :initial_state, class_name: 'State'
  belongs_to :flow

  validates_presence_of :name, :flow #, :initial_state
  validates_uniqueness_of :name
  validates_numericality_of :turn_around_days, :greater_than_or_equal_to => 0, :allow_nil => true, :only_integer => true

  delegate :initial_state, to: :flow
  attr_accessor :flow_name #,:initial_state_name

  # def initial_state_name=(initial_state_name)
  #   self.initial_state = State.find_by(name: initial_state_name)
  # end

  def flow_name=(flow_name)
    self.flow = Flow.find_by(name: flow_name)
  end

  def multi_team_quant_essential
    initial_state.multi_team_quant_essential?
  end

end
