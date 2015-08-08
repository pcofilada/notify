class Api::V1::HomeController < ApplicationController

  def index
    channels = Channel.where(status: 'active').order(created_at: :desc)

    render json: channels, status: 200
  end

  def show
    channel = Channel.find(params[:id])

    render json: channel, status: 200
  end

end
