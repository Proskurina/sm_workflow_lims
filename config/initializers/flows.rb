require './config/data/flows'

DependentLoader.start(:flows) do |on|
  on.success do
    FlowFactory.seed
  end
end