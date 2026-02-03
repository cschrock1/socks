class Match < ApplicationRecord
  belongs_to :sock_1, class_name: "Sock"
  belongs_to :sock_2, class_name: "Sock"
end
