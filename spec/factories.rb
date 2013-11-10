FactoryGirl.define do
  factory :user do
    name     "testUser"
    email    "testUser@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
