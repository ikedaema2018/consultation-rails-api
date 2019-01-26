class WorriesController < ApplicationController
  before_action :check_auth
  skip_before_action :check_auth, only: [:index, :show]

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

  def show
    worry = Worry.find(params[:id])
    worry_user = {name: worry.user.name}
    user_ids = worry.worry_comments.pluck(:user_id)
    p "---------------------------------"
    p user_ids
    worry_comments_users = User.where(id: user_ids).flat_map{|d| [name: d.name]}
    render json: {worry: worry, worry_user: worry.user, worry_comments: worry.worry_comments, worry_comment_users: worry_comments_users  }
  end


  private
    def create_params
      params.require(:worry).permit(:worry).merge(user_id: @user.id)
    end
end
