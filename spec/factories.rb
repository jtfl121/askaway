FactoryGirl.define do
  factory :answer do
    answer {Faker::Lorem.sentence}
  end
  factory :question do
    question {Faker::Lorem.sentence}
  end
  factory :user do
    email                  {Faker::Internet.email}
    password               'password'
    password_confirmation  'password'
  end
end
