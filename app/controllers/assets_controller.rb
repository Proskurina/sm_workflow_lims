require './app/presenters/asset/index'

class AssetsController < ApplicationController

  #Assets updater creates new events for assets and moves assets to the next state
  def update
    if assets_provided
      updater = Asset::Updater.create!(assets: assets_to_be_updated, action: params[:asset_action])
      flash[updater.flash_status] = updater.message
      redirect_to flow_assets_path(flow, state: updater.redirect_state)
    else
      flash[:error] = 'No assets selected'
      redirect_to :back
    end
  end

  def index
    unless params[:state].present? || params[:identifier].present?
      redirect_to root_path
    else
      assets = Asset.in_state(state, flow)
                    .with_identifier(params[:identifier])
      @presenter = Presenter::AssetPresenter::Index.new(assets, flow, search, state)
    end
  end

  private

  def state
    State.find_by(name: params[:state])
  end

  def search
    params[:identifier] && "batch id or asset identifier matches '#{params[:identifier]}'"
  end

  def assets_provided
    params[:assets].is_a?(Hash) && params[:assets].keys.present?
  end

  def assets_to_be_updated
    @assets||=Asset.find(params[:assets].keys)
  end

  def flow
    @flow ||= Flow.find_by(id: params[:flow_id])
  end

end