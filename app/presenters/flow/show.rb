require './app/presenters/presenter'

module Presenter::FlowPresenter

  class Show < Presenter

    attr_reader :flow

    def initialize(flow)
      @flow = flow
    end

    def flow_id
      flow.id
    end
  end

end