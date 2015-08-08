class Api::V1::HomeController < ApplicationController

  def channels
    channel = Channel.where(status: 'active').order(created_at: :desc)

    render json: channel, status: 200
  end

end
