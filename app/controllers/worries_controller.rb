class WorriesController < ApplicationController
  before_action :check_auth

  def create
    worry = Worry.new(
      create_params
    )
    if worry.save
      render json: worry
    else
      render status: 404
    end

  end


  private
    def create_params
      params.require(:worry).permit(:worry).merge(user_id: @user.id)
    end
end
