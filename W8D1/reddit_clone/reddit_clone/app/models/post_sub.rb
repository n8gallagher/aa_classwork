# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  post_id    :integer
#  sub_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PostSub < ApplicationRecord
  belongs_to :post,
    class_name: :Post,
    foreign_key: :post_id

  belongs_to :sub,
    class_name: :Sub,
    foreign_key: :sub_id
end
