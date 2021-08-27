FactoryBot.define do
  factory :order_address do
    postal_code    {"123-4567"}
    prefecture_id  { 2 }
    city           { "新宿区" }
    house_number   { "11-1" }
    building_name  { "TITIハイツ" }
    tel            { "0312341234" }
  end
end
