class Question < ApplicationRecord
  validates :question, presence: true
  
  default_scope { order(created_at: :desc)}

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
end
