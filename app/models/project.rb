class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :nullify

  has_many :members, dependent: :destroy
  has_many :projectmembers, through: :members, source: :user

  validates :title, presence: {message: "Must provide a title!"}, uniqueness: {scope: :title}
  validates :description, presence: {message: "Must provide body"}
  
end

