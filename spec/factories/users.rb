# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |index|
      "ryan.pham_#{index}@mailinator.com"
    end
    password { 'Aa12345678!' }
  end
end
