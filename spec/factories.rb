FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user-#{n}" }
    password "mypass"
    password_confirmation {|a| a.password}
    after(:create) { |u| u.password = nil }
  end

  factory :post do
    sequence(:title) { |n| "My awesome post #{n}" }
    association :user
  end

  factory :article, :class => :article, :parent => :post do
    body "Some _random_ text"
    published true
  end

  factory :link, :class => :link, :parent => :post do
    url "example.com"
    description "some text"
    published true
  end  
end

