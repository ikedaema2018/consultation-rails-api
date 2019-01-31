class WorryCommentsController < ApplicationController
  before_action :check_auth

  def create
    p params
    worry_comment = WorryComment.new(create_params)

    if worry_comment.save
      render json: {worry_comment: worry_comment}
    else
      render status: 404, json: {error: "error"}
    end
  end


  private
    def create_params
      params.require(:worry_comment).permit(:comment, :worry_id).merge(user_id: @user.id)
    end

end
