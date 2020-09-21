FactoryBot.define do
  factory :user do
    name { 'name_test' }
    email { 'name_test@gmail.com' }
    password { 'pass_test' }
    hourly_pay { 'MyString' }
  end
end
