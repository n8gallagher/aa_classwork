class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :artist_id, uniqueness: true
    validates :title, uniqueness: {scope: :artist_id}
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares, dependent: :destroy,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments, dependent: :destroy,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :likes, as: :likeable

end
