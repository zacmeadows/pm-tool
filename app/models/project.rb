class Project < ActiveRecord::Base
  validates :title, presence: {message: "Must provide a title!"}, uniqueness: {scope: :title}
end

