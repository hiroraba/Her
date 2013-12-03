FactoryGirl.define do
  factory :user do
    name     "testUser"
    email    "testUser@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :todolist do
    title "I watched Ametalk."
    priority 1
    allDay true
    user
  end
end
