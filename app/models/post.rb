class Post < ApplicationRecord
  belongs_to :user

  validates :title,
    presence: true,
    length: {maximum: 100},
    on: :create,
    allow_nil: false

  validates :body,
    presence: true,
    length: {maximum: 1400},
    on: :create,
    allow_nil: false

  validates :tags,
    presence: true,
    length: {maximum: 100},
    on: :create,
    allow_nil: false

end
