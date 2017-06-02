class Workflow < ActiveRecord::Base

  has_many :assets
  belongs_to :flow

  validates_presence_of :name, :flow
  validates_uniqueness_of :name
  validates_numericality_of :turn_around_days, greater_than_or_equal_to: 0, allow_nil: true, only_integer: true

  delegate :initial_state, to: :flow

  delegate :multi_team_quant_essential?, :sample_management?, to: :flow?

  attr_accessor :flow_name

  def flow_name=(flow_name)
    self.flow = Flow.find_by(name: flow_name)
  end

  def flow?
    flow.name.parameterize.underscore.inquiry
  end

end
