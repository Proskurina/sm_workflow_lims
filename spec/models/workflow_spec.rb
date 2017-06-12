require 'rails_helper'

describe Workflow do

  let!(:volume_check) { create :stage, name: 'volume_check' }

  context "with valid parameters" do
    let!(:test_name) { 'test' }
    let!(:has_comment) { true }
    let(:workflow) { Workflow.new(name: test_name, has_comment: has_comment, initial_stage_name: 'volume_check') }

    it 'can be created' do
      workflow = Workflow.new(:name=>test_name,:has_comment=>has_comment,:turn_around_days=>2, initial_stage: volume_check)
      workflow.valid?.should eq(true)
      expect(workflow).to have(0).errors_on(:name)
      expect(workflow).to have(0).errors_on(:has_comment)
      expect(workflow).to have(0).errors_on(:turn_around_days)
      workflow.name.should eq(test_name)
      workflow.has_comment?.should eq(has_comment)
    end

    it 'has many assets' do
      workflow.assets.new(:identifier=>'test')
      workflow.assets.size.should eq(1)
      workflow.assets.first.identifier.should eq('test')
    end

    it 'should know its initial stage' do
      expect(workflow.initial_stage).to eq volume_check
    end

  end

  context "with invalid parameters" do

    it 'requires a name' do
      workflow = Workflow.new()
      expect(workflow).to have(1).errors_on(:name)
      workflow.valid?.should eq(false)
    end

    it 'requires a unique name' do
      workflow = Workflow.create!(:name=>'test1', initial_stage: volume_check)
      workflow = Workflow.create(:name=>'test1')
      expect(workflow).to have(1).errors_on(:name)
      workflow.valid?.should eq(false)
    end

    it 'can not have a negative turn around time' do
      workflow = Workflow.new(:name=>'test',:turn_around_days=>-1)
      expect(workflow).to have(1).errors_on(:turn_around_days)
      workflow.valid?.should eq(false)
    end

  end

end

