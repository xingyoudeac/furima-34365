require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが被っていた場合には登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@がない場合は登録できない" do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下は登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英語のみでは登録できない" do
      @user.password = "abcdfg"
      @user.password_confirmation = "abcdfg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが数字のみは登録できない" do
      @user.password = '123456'
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが全角英数混合では登録できない" do
      @user.password = 'あいうえおかき'
      @user.password_confirmation = "あいうえおかき"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "全角以外は登録出来ない" do
      @user.family_name = 'ore'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "全角以外は登録出来ない" do
      @user.first_name = 'ore'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "family_readが空では登録できない" do
      @user.family_read = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family read can't be blank")
    end
    it "first_readが空では登録できない" do
      @user.first_read = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First read can't be blank")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end