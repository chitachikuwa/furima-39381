FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6) + 'A1'}
    password_confirmation {password}
    last_name { '山田'}
    first_name {'花子'}
    kane_last_name {'ヤマダ'}
    kana_first_name {'ハナコ'}
    birth {Faker::Date.birthday}
  end
end
