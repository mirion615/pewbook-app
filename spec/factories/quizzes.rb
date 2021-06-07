FactoryBot.define do
  factory :quiz do
    category_id { 2 }
    question  { Faker::Verb.base }
    correct   { '遊ぶ' }
    incorrect1 {'投げる'}
    incorrect2 {'踏む'}
    answer_description {'阿蘇という意味です'}
    association :user
  end
end