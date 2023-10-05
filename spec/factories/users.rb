FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"苗字"}
    last_name             {"名前"}
    first_name2           {"ミョウジ"}
    last_name2            {"ナマエ"}
    birthday              {"2000-01-01"}
  end
end