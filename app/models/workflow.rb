class Workflow < ActiveRecord::Base

  has_many :assets
  belongs_to :initial_stage, class_name: 'Stage'

  validates_presence_of :name, :initial_stage
  validates_uniqueness_of :name
  validates_numericality_of :turn_around_days, :greater_than_or_equal_to => 0, :allow_nil => true, :only_integer => true

  attr_accessor :initial_stage_name

  def initial_stage_name=(initial_stage_name)
    self.initial_stage = Stage.find_by(name: initial_stage_name)
  end

  def multi_team_quant_essential
    initial_stage.multi_team_quant_essential?
  end

end
