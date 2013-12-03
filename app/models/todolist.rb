class Todolist < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') } 
  validates :title, presence: true, length: {minimum: 5, maximum: 30}
  validates :priority, inclusion: { in: 1..5 }
  validates :user_id, presence: true
end
