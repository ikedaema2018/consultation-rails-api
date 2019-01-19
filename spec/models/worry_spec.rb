require 'rails_helper'

RSpec.describe Worry, type: :model do
  describe "can't be blank" do
    before do
      @worry = Worry.create(
        worry: nil,
        user_id: nil
      )
      @worry.valid?
    end

    it "worry can't be blank" do
      expect(@worry.errors[:worry]).to include("can't be blank")
    end

    it "user_id can't be blank" do
      expect(@worry.errors[:user_id]).to include("can't be blank")
    end
  end
end
