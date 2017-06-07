class Election < ApplicationRecord
    validates :article_id, length: { is: 6 }
end
