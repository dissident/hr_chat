class Message < ApplicationRecord

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :room, class_name: 'User', foreign_key: 'room_id'

end
