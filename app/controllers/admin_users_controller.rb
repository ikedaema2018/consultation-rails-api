class AdminUsersController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user
      render json: @user
    else
      render status: 403, json: { aaa: "aaaa" }
    end
  end

  def index
    @jjj = [
      aaa: 222,
      bbb: 333
    ]
    render @jjj
  end
  
end
