class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book, counter_cache: true
  validates_uniqueness_of :book_id, scope: :user_id
end
