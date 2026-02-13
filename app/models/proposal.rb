class Proposal < ApplicationRecord
  # A proposed match links two socks before a final match is created.
  belongs_to :sock_1, class_name: "Sock"
  belongs_to :sock_2, class_name: "Sock"
end
