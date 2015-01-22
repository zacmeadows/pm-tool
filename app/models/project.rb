class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  validates :title, presence: {message: "Must provide a title!"}, uniqueness: {scope: :title}
end

