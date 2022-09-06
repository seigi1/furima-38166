FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { 'test@test' }
    password               { 'a123456' }
    password_confirmation  { password }
    family_name            { '山田' }
    first_name             { '太郎' }
    read_family            { 'ヤマダ' }
    read_first             { 'タロウ' }
    birth_date             { '1930-01-01' }
  end
end
