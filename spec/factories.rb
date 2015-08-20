FactoryGirl.define do
  factory :user do
    name     "seisho31"
    email    "seisho31@seisho.jp"
    password "seisho31"
    password_confirmation "seisho31"
    homeroom
  end

  factory :homeroom do
  	shop_name "Maeda Store"
  	content "hello"
  	menu "sushi 100yen"
  end

  factory :post do
  	title "takoyaki 150yen"
  	content "takoyaki 200yen -> 150yen"
  	homeroom
  end
end

