require 'rails_helper'

describe Stage do

  let(:stage) { Stage.new }

  it 'should have name' do
    expect(stage.valid?).to be false
    stage.name = 'name'
    expect(stage.valid?).to be true
  end

  it 'should know if it is default' do
    expect(stage.default?).to be_falsey
  end


end