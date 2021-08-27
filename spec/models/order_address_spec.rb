require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '投稿の保存' do
    context '投稿が出来る場合' do
      it "全ての項目が存在すれば登録出来る" do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '投稿が出来ない場合' do
      it "郵便番号が無いと投稿出来ない" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンが無いと投稿出来ない" do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "都道府県が無いと投稿出来ない" do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県が1だと登録できない"do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市町村が無いと投稿出来ない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が無いと投稿出来ない" do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が無いと投稿出来ない" do
        @order_address.tel = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it "電話番号は11桁以内で無いと投稿出来ない" do
        @order_address.tel = '080123412345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end
    end
  end
end