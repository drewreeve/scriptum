FactoryGirl.define do
  factory :user do
    username "Bob"
    password "mypass"
    password_confirmation {|a| a.password}
    after_create { |u| u.password = nil }
  end

  factory :post do
    sequence(:title) { |n| "My awesome post #{n}" }
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

