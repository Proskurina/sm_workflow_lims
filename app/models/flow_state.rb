class FlowState < ActiveRecord::Base
  belongs_to :state
  belongs_to :flow
end
