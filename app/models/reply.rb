class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content,
  presence: true,
  length: {maximum: 600},
  on: :create,
  allow_nil: false
end
