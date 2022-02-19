require 'rails_helper'
describe User do
  describe '#create' do
  

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end


    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end



    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    it "fist_nameが空では登録できない" do
      user = build(:user, fist_name: "")
      expect(user).to be_valid
    end
    it "last_nameが空では登録できない" do
      user = build(:user, last_name: "")
      expect(user).to be_valid
    end
    it "fist_name_kanaが空では登録できない" do
      user = build(:user, fist_name_kana: "")
      expect(user).to be_valid
    end
    it "last_name_kanaが空では登録できない" do
      user = build(:user, last_name_kana: "")
      expect(user).to be_valid
    end
    it "birth_dayが空では登録できない" do
      user = build(:user, birth_day: "")
      expect(user).to be_valid
    end
  end
end
