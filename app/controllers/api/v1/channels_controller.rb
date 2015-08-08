class Api::V1::ChannelsController < ApplicationController
  before_action :authenticate_with_token!, only: [:show, :index, :create, :update]
  before_action :set_channel, only: [:update, :show]

  def show
    render json: @channel, status: 200
  end

  def index
    channels = current_user.channels

    render json: channels, status: 200 
  end

  def create
    channel = current_user.channels.new(channel_params)

    if channel.save
      render json: channel, status: 201
    else
      render json: { errors: channel.errors.full_messages }, status: 422 
    end
  end

  def update
    if @channel.update(channel_params)
      render json: @channel, status: 201
    else
      render json: { errors: @channel.errors.full_messages }, status: 422
    end
  end

private

  def set_channel
    @channel = current_user.channels.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:logo, :status, :title, :description, :category)
  end

end
