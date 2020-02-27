require 'rails_helper'

RSpec.describe Post, "test about model", type: :model do
  describe 'association' do
    it "belongs_to user" do
      is_expected.to belongs_to(:user)
    end
  end

  describe 'do post' do
    context "do create posts" do
      it "create posts with user_id" do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:post, user_id: user.id)).to be_valid
      end
    end
    context "if failed to do" do
      it "user_id couldnt in column" do
        expect(FactoryBot.build(:post)).to_not be_valid
      end
      it "title was empty" do
        expect(FactoryBot.build(:post, :no_title)).to_not be_valid
      end
      it "body was empty" do
        expect(FactoryBot.build(:post, :no_body)).to_not be_valid
      end
      it "body was over 200 lettera" do
        expect(FactoryBot.build(:post, :too_long_body)).to_not be_valid
      end
    end
  end
end
