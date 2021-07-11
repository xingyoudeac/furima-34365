require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "田中", first_name: "田中", family_read: "タナカ", first_read: "タナカ", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "aaa", email: "", password: "00000000", password_confirmation: "00000000", family_name: "田中", first_name: "田中", family_read: "タナカ", first_read: "タナカ", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "", password_confirmation: "", family_name: "田中", first_name: "田中", family_read: "タナカ", first_read: "タナカ", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが合致していないと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", family_name: "田中", first_name: "田中", family_read: "タナカ", first_read: "タナカ", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "", first_name: "田中", family_read: "タナカ", first_read: "タナカ", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "田中", first_name: "", family_read: "タナカ", first_read: "タナカ", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_readが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "田中", first_name: "田中", family_read: "", first_read: "タナカ", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("Family read can't be blank")
    end
    it "first_readが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "田中", first_name: "", family_read: "タナカ", first_read: "", birthday: "19970723")
      user.valid?
      expect(user.errors.full_messages).to include("First read can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name: "田中", first_name: "田中", family_read: "タナカ", first_read: "タナカ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end