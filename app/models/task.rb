class Task < ActiveRecord::Base
  belongs_to :project
  
  validates :title, presence: true # Ask about uniqueness within a project. Has something to do with associations. 
end
