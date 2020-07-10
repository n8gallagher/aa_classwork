class Comment < ApplicationRecord
    validates :body, :artwork_id, :user_id, presence: true

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id

    has_many :likes, as: :likeable

end
