# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reported_book do
    book_id 1
    user_id 1
    report_cause 1
  end
end