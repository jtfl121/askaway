class Question < ApplicationRecord
  include PgSearch

  validates :question, presence: true
  
  default_scope { order(created_at: :desc)}

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers

  acts_as_taggable

  pg_search_scope :search_for, 
    against: [
      :question
    ],
    associated_against: {
      tags: [:name]
    },
    using: {
            tsearch: {any_word: true, 
                          prefix: true
            }
          }
end
