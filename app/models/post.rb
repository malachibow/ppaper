class Post < ApplicationRecord
  belongs_to :user

  validates :title,
    presence: true,
    length: {maximum: 100},
    on: :create,
    allow_nil: true

  validates :body,
    presence: true,
    length: {maximum: 600},
    on: :create,
    allow_nil: false

  validates :tags,
    length: {maximum: 100},
    on: :create

  def self.randomize
    all.order(RANDOM())
  end

end
