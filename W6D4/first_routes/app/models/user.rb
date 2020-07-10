class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks, dependent: :destroy,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :artworks_viewed, dependent: :destroy,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :artworks_viewed,
        source: :artwork

    has_many :comments, dependent: :destroy,
        class_name: :Comment,
        foreign_key: :user_id

    has_many :likes, as: :likeable
        
end
