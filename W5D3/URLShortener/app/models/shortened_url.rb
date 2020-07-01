# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true

    def self.random_code
        code = SecureRandom.urlsafe_base64
        code = code[0..15]
        until !exists?(code)
            code = SecureRandom.urlsafe_base64
            code = code[0..15]
        end
        code
    end

    def create!(user, long_url) # http://facebook.com/group/kjldaksdjhagsd/post=lashjdlkj
        code = ShortenedUrl.random_code
        #short.ly/lkdfjslfkjdslkfjdsl
        short = long_url.split(".")
        short_second = short[1].split('/')
        short.first + short_second.first #
    end



end
