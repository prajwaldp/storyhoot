# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content "MyString"
    book_id 1
    user_id 1
    username "MyString"
  end
end
