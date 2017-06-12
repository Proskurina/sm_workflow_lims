require './config/data/asset_types'
require './config/data/stages'
require './config/data/workflows'
require './config/data/pipeline_destinations'

AssetTypeFactory.seed
PipelineDestinationFactory.seed
StageFactory.seed
WorkflowFactory.seed
