class RreplyFavorite < ApplicationRecord
  belongs_to :rreply
  belongs_to :user
end
