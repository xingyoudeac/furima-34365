FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    family_name           {'田中'}
    first_name            {'田中'}
    family_read           {'タナカ'}
    first_read            {'タナカ'}
    birthday              {'19970723'}
  end
end