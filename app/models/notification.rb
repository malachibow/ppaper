class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :post
  enum type: ['favorite', 'reply', 'report']
end
