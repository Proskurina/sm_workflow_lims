require './app/presenters/flow/show'

class FlowsController < ApplicationController

  def show
    @presenter = Presenter::FlowPresenter::Show.new(flow)
  end

  def flow
    @flow ||= Flow.find_by(id: params[:id])
  end

end