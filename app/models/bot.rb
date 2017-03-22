class Bot < ApplicationRecord
  validates :article_id, presence: true, length: { maximum: 10 }
  validates :url, presence: true
end
