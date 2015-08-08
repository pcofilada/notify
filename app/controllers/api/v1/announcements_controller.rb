class Api::V1::AnnouncementsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :create]
  before_action :set_channel, only: [:index, :create]
  
  def index
    announcements = @channel.announcements

    render json: announcements, status: 200
  end

  def create
    announcement = @channel.announcements.new(announcement_params)

    if announcement.save
      render json: announcement, status: 201
    else
      render json: { errors: announcement.errors.full_messages }, status: 422
    end
  end
  
private

  def set_channel
    @channel = current_user.channels.find(params[:channel_id])
  end

  def announcement_params
    params.require(:announcement).permit(:title, :message)
  end

end
