FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"桃"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"モモ"}
    birthday              {"2000-01-01"}

  end
end