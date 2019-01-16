require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model blank return" do
    before do
      @user = User.new(
        name: nil,
        email: nil,
        password: nil,
        password_confirmation: nil,
        gender: nil,
        age: nil,
        introduction: nil,
      )
      @user.valid?
    end

    context "don't blank or OK" do
      it "name eq don't blank" do
        expect(@user.errors[:name]).to include("can't be blank")
      end
      it "email eq don't blank" do
        expect(@user.errors[:email]).to include("can't be blank")
      end
      it "password eq don't blank" do
        expect(@user.errors[:password_digest]).to include("can't be blank")
      end
      it "age eq don't blank" do
        expect(@user.errors[:age]).to include("can't be blank")
      end
      it "gender eq don't blank" do
        expect(@user.errors[:gender]).to include("can't be blank")
      end
      it "introduction eq can blank" do
        expect(@user.errors[:introduction]).not_to include("can't be blank")
      end
    end
  end

  it "email not unique" do
    User.create(
      name: "kei",
      email: "keimae@gmail.com",
      password: "keimae0817",
      password_confirmation: "keimae0817",
      gender: "男",
      age: "18",
      introduction: "ども"
    )
    user2 = User.new(
      name: "kei",
      email: "keimae@gmail.com",
      password: "keimae0817",
      password_confirmation: "keimae0817",
      gender: "男",
      age: "18",
      introduction: "ども"
    )
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "password not eq password_confirmation" do
    user = User.new(
      name: "kei",
      email: "keimae@gmail.com",
      password: "keimae0817",
      password_confirmation: "keimae081",
      gender: "男",
      age: "18",
      introduction: "ども"
    )

    expect(user).not_to be_valid
  end
end
