class WorriesController < ApplicationController
  before_action :check_auth
  skip_before_action :check_auth, only: [:index]

  def create
    worry = Worry.new(
      create_params
    )
    if worry.save
      render json: worry
    else
      render status: 404, json: { aaa: "aaa" }
    end
  end

  def index
    worries = Worry.joins(:user).select('worries.*, users.name')
    render json: worries
  end


  private
    def create_params
      params.require(:worry).permit(:worry).merge(user_id: @user.id)
    end
end
