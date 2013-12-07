# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deposit do
    weight 20
    weighed_at DateTime.now
    quality "MyString"
    farm
    cp
  end
end
