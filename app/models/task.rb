class Task < ActiveRecord::Base
  validates :title, presence: true # Ask about uniqueness within a project. Has something to do with associations. 
end
