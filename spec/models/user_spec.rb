require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "fist_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", fist_name:"")
      user.valid?
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", fist_name:"あ", last_name:"")
      user.valid?
    end
    it "fist_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", fist_name:"あ", last_name:"あ", fist_name_kana:"")
      user.valid?
    end
    it "last_name_kanaが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", fist_name:"あ", last_name:"あ", fist_name_kana:"ア", last_name_kana:"")
      user.valid?
    end
    it "birth_dayが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", fist_name:"あ", last_name:"あ", fist_name_kana:"ア", last_name_kana:"ア", birth_day:"")
      user.valid?
    end
  end
end