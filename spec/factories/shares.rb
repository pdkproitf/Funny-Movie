FactoryBot.define do
  factory :share do
    url         { 'https://www.youtube.com/watch?v=XC7dagtU_Lk' }
    title       { 'Title' }
    description { 'description' }
    user_id     { nil }
  end
end
