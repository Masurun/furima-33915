FactoryBot.define do
  factory :user do
    nickname                  { 'test' }
    email                     { 'test@test.com' }
    password                  { 'a11111' }
    password_confirmation     { password }
    first_name                { '山田' }
    last_name                 { '太郎' }
    first_name_kana           { 'ヤマダ' }
    last_name_kana            { 'タロウ' }
    birth                     { '1996-12-23' }
  end
end
