FactoryGirl.define do
  factory :user do
    name "Mr.Foo"
    email { "#{name.gsub(/ /, '-')}@lujeri.com" }
    password "password"
  end

  factory :admin, class: Admin, parent: :user do |user|
    user.type { "Admin" }
    user.confirmed_at  {1.day.ago }
  end
  factory :analyst, class: Analyst, parent: :user do |user|
    user.type { "Analyst" }
    user.confirmed_at  {1.day.ago }
  end
  factory :intern, class: Intern, parent: :user do |user|
    user.type { "Intern" }
    user.confirmed_at  {1.day.ago }
  end
  factory :unconfirmedUser, class: Intern, parent: :user do |user|
    user.type { "Intern" }
  end
end