require './config/data/stages'

DependentLoader.start(:stages) do |on|
  on.success do
    StageFactory.seed
  end
end