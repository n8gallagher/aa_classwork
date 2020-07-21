# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
    validates :title, :description, :moderator_id, presence: true

    belongs_to :moderator,
        class_name: :User,
        foreign_key: :moderator_id
        
    has_many :postsubs,
        class_name: :PostSub,
        foreign_key: :sub_ids
        
    has_many :posts,
        through: :postsubs,
        source: :post
    end
