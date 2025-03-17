FactoryBot.define do
  factory :post do
    title { 'Title' }
    content { 'Content' }

    user { association :user }

    trait :with_sections do
      after(:build) do |model|
        model.sections << create(:section)
        model.sections << create(:section, :important)
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
