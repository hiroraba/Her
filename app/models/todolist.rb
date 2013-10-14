class Todolist < ActiveRecord::Base
  belongs_to :user
  validates :content, length: {minimum: 5, maximum: 30}
  validates :priority, inclusion: { in: 1..5 }
end
