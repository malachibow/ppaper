class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reply_favorites
  has_many :rreply_favorites

  after_create do
    self.read_notification = DateTime.current
    self.save
  end
end
