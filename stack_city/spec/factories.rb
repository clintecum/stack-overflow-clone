FactoryGirl.define do
  factory :user do
    username "IamDwyane"
    email   "myemail@gmail.com"
    first_name "Dwyane"
    last_name  "Dwyane"
    location   "Georgia"
    password   "1234"
  end

  factory :question do
    title "What is Dwyane?"
    body  "Dwyane is the Rock?"
    association :user, factory: :user, username: "IamDwyane"
  end
end

