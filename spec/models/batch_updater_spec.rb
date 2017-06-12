require 'rails_helper'

describe Batch::Updater do

  before do
    Timecop.freeze(Time.local(2017, 3, 7))
  end

  it 'should not be valid if the begun_at date is wrong, required attributes were not provided' do
    batch_updater = Batch::Updater.new(
      begun_at: '005/05/23456',
    )
    expect(batch_updater.valid?).to be false
    expect(batch_updater.errors.messages.count).to eq 3
    expect(batch_updater).to have(1).errors_on(:batch)
    expect(batch_updater).to have(1).errors_on(:workflow)
    expect(batch_updater).to have(1).errors_on(:dates)
  end

  it 'should create the right batch and the right assets' do
    stage = create :stage, name: 'in_progress'
    workflow = create :workflow, name: 'New workflow'
    batch = create :batch_with_assets
    batch_updater = Batch::Updater.new(
      batch: batch,
      workflow: workflow
    )
    batch.assets.each do |asset|
      expect(asset.workflow.name).not_to eq 'New workflow'
    end
    batch_updater.update!
    batch.reload
    batch.assets.each do |asset|
      expect(asset.workflow.name).to eq 'New workflow'
    end
  end

  after(:each) do
    Timecop.return
  end

end