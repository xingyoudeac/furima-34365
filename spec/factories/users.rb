FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa111'}
    password_confirmation {'aaa111'}
    family_name           {'田中'}
    first_name            {'田中'}
    family_read           {'タナカ'}
    first_read            {'タナカ'}
    birthday              {'19970723'}
  end
end