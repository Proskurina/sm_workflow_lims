class Event < ActiveRecord::Base
  belongs_to :asset
  belongs_to :stage

  validates_presence_of :asset, :stage

  attr_accessor :stage_name

  def stage_name=(stage_name)
    self.stage = Stage.find_by(name: stage_name)
  end

  def self.latest_event_per_asset
    select("MAX(id)").group("asset_id")
  end

  def self.with_last_stage(stage)
    where(id: latest_event_per_asset, stage: stage)
  end

  def self.completed_between(start_date, end_date)
    stage = Stage.find_by(name: 'completed')
    where(created_at: start_date..end_date, stage: stage)
  end

end