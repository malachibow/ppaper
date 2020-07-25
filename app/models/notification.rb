class Notification < ApplicationRecord
  belongs_to :user
  enum type: ['favorite', 'reply', 'report']
end
