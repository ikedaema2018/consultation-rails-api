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
    @test = {a: "aaa", b: "bbb"}
    p @test[:a]
    render json: @test
  end

  def create_params
    params[:user].permit(:name, :email, :password, :password_confiramtion, :gender, :age, :introduction)
  end
end
