require 'rails_helper'

describe Stage do

  let(:stage) { Stage.new }

  it 'should have name' do
    expect(stage.valid?).to be false
    stage.name = 'name'
    expect(stage.valid?).to be true
  end

end