require './app/presenters/presenter'
require './app/presenters/asset/asset'

module Presenter::AdminPresenter
  class Index < Presenter

    def flows
      @flows ||= Flow.all
    end

  end
end
