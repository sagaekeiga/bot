class Bot < ApplicationRecord
  validates :url, presence: true
  validates :article_id, length: { is: 6 }
end
