class Project < ActiveRecord::Base
  belongs_to :user

  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :nullify

  has_many :members, dependent: :destroy
  has_many :projectmembers, through: :members, source: :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :title, presence: {message: "Must provide a title!"}, uniqueness: {scope: :title}
  validates :description, presence: {message: "Must provide body"}
  
end

