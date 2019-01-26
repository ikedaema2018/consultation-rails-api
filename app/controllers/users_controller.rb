class UsersController < ApplicationController
  require 'redis'

  def create
    p create_params
    @user = User.create(create_params)
    render json: @user

  rescue ActiveRecord::RecordNotUnique =>  e
    render status: 422, json: { error: 'RecordNotUnique', status: 422 }
  end

  def test
    render json: {"user": "dada"}
    Redis.current.set("hoge", "fuga")
    session[:user_email] = 'test@a.a'
  end

  def index
    render json: {"user": "dada"}
  end

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :age, :introduction)
  end
end
