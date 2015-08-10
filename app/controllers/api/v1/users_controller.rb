class Api::V1::UsersController < ApplicationController
  
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  def subscribed
    channels_id = User.find(params[:id]).subscriptions.pluck(:channel_id).uniq
    channels = Channel.find(channels_id)


    render json: channels, status: 200, root: false
  end

private
  
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :age, :mobile_number)
  end

end
