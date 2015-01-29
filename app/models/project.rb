class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :nullify

  validates :title, presence: {message: "Must provide a title!"}, uniqueness: {scope: :title}
end

