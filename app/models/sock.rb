# a model is a representation of data and business logic in the application
class Sock < ApplicationRecord
    has_many :matches_as_sock_1, class_name: 'Match', foreign_key: 'sock_1_id', dependent: :destroy
    has_many :matches_as_sock_2, class_name: 'Match', foreign_key: 'sock_2_id', dependent: :destroy
    
    def matched_socks
        matched = matches_as_sock_1.includes(:sock_2).map(&:sock_2) + matches_as_sock_2.includes(:sock_1).map(&:sock_1)
        matched.uniq
    end
end
