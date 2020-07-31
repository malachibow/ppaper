class Rreply < ApplicationRecord
  belongs_to :reply
  
  validates :content,
  presence: true,
  length: {maximum: 600},
  on: :create,
  allow_nil: false
end
