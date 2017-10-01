class Answer < ApplicationRecord

  validates :answer, presence: true

  belongs_to :question
  belongs_to :user
end
