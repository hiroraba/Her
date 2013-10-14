class User < ActiveRecord::Base
  has_many :todolists
end
