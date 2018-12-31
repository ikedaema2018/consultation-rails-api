class UsersController < ApplicationController
  def create
    @user = User.create(create_params)
    p @user
    render json: @user
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
