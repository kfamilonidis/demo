FactoryBot.define do
  factory :post do
    title { Faker::Quote.matz }
    content { Faker::Lorem.paragraph }

    user { association :user }

    trait :with_sections do
      after(:build) do |model|
        model.sections << create(:section)
        model.sections << create(:section, :important)
      end
    end

    trait :with_comments do
      after(:build) do |model|
        create(:comment, commentable: model)
      end
    end

    trait :draft do
      status { :draft }
    end

    trait :published do
      status { :published }
    end
  end
end
