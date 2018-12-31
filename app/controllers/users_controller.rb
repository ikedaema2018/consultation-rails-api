class UsersController < ApplicationController
  def create
    @user = User.create(create_params)
    render json: @user

  
  # rescue ActiveRecord::RecordNotUnique =>  e
  #   render status: 422, json: { error: 'RecordNotUnique', status: 422 } 
  # end
    # rescue_from Exception, with: :handle500


    # def handle500
    #   p "dawdawdadadawdawdawdaw"
    #   render status: 500
    # end
  end

  def index
    render json: {test: "test"}
  end

  def test
    p "aaaaaa"
    @user = User.all
    render json: @user
  end

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :age, :introduction)
  end
end
