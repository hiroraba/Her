FactoryGirl.define do
  factory :user do
    name     "testUser"
    email    "testUser@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :todolist do
    content "I watched Ametalk."
    priority 1
    user
  end
end
