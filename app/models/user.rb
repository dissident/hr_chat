class User < ApplicationRecord

  CANDIDATE_ROLE = 0
  HR_ROLE = 1

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :room_messages, foreign_key: 'room_id', class_name: 'Message'
  has_many :messages, foreign_key: 'owner_id'

  scope :candidate, ->(id) {
                             includes(:room_messages)
                             .where(id: id)
                             .where(role: User::CANDIDATE_ROLE)
                             .where(open: true)
                             .first
                           }
  scope :hrs, ->(id) {
                      where(role: User::HR_ROLE)
                      .where.not(id: id)
                     }
  scope :clean_users, -> {
                           where(role: User::CANDIDATE_ROLE)
                           .where(open: false)
                         }

  def hr?
    role == HR_ROLE
  end

  def who_can_enter
    result = allowed.to_a
    result << opener
    result << id
  end

end
