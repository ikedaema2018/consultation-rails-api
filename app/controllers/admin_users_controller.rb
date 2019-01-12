class AdminUsersController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: user
    else
      render status: 403, json: { aaa: "aaaa" }
    end

  rescue
    render status: 500, json: {bbb: "bbbb"}
  end


  
end
