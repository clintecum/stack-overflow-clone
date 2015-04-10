FactoryGirl.define do

  factory :answer do
    content "Answer Content"
    question
    user
  end

  factory :question do
    title "Question Title"
    body "Question Body"
    user

    factory :question_with_answers do
      transient do
        answers_count 2
      end

      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question)
      end
    end
  end

  factory :user do
    username "IamDwyane"
    email "myemail@gmail.com"
    password "poop"

    factory :user_with_questions do
      transient do
        questions_count 5
      end

      factory :user_with_answers do
        transient do
          answers_count 5
        end

        after(:create) do |user, evaluator|
          create_list(:question, evaluator.questions_count, user: user)
          create_list(:answer, evaluator.answers_count, user: user)
        end
      end
    end
  end
end

