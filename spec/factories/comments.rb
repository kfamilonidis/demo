FactoryBot.define do
  factory :comment do
    content { 'Content' }

    user { association :user }
  end
end
