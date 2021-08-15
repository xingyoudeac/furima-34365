require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '投稿の保存' do
    context '投稿が出来る場合' do
      it "全ての項目が存在すれば登録出来る" do
        item = FactoryBot.build(:item)
        expect(@item).to be_valid
      end
    end

    context '投稿が出来ない場合' do
      it "商品名が無いと投稿出来ない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明が無いと投稿出来ない" do
        @item.concept = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it "カテゴリーが無いと投稿出来ない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーのカラムはidが1では投稿出来ない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が無いと投稿出来ない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "コンディションのカラムはidが1では投稿出来ない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が無いと投稿出来ない" do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "配送料の負担のカラムはidが1では投稿出来ない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "発送元の地域が無いと投稿出来ない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域のカラムはidが1では投稿出来ない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数がないと投稿出来ない" do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "発送までの日数のカラムはidが1では投稿出来ない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "販売価格が無いと投稿出来ない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が¥299だと投稿出来ない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が¥10,000,000だと投稿出来ない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格は全角数字混合では投稿出来ない" do
        @item.price = '４000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "半角英数混合では投稿出来ない" do
        @item.price = '4000q'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "半角英語だけでは投稿出来ない" do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end