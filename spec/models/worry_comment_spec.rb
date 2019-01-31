require 'rails_helper'

RSpec.describe WorryComment, type: :model do
  describe "blank error" do
    before do
      @worry_comment = WorryComment.new(
        comment: nil,
        user_id: nil,
        worry_id: nil
      )
      @worry_comment.valid?
    end

    context "don't blank" do
      it "comemnt don't blank" do
        expect(@worry_comment.errors[:comment]).to include("can't be blank")
      end

      it "user_id can't be blank" do
        expect(@worry_comment.errors[:user_id]).to include("can't be blank")
      end

      it "worry_id can't be blank" do
        expect(@worry_comment.errors[:worry_id]).to include("can't be blank")
      end
    end
  end


  
end
