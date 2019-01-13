class UsersController < ApplicationController
  def create
    p create_params
    @user = User.create(create_params)
    render json: @user

  
  rescue ActiveRecord::RecordNotUnique =>  e
    render status: 422, json: { error: 'RecordNotUnique', status: 422 } 
  
  end

  def index
    render json: {test: "test"}
  end

  def test
    @user = User.all
    render json: @user
  end

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :age, :introduction)
  end
end
