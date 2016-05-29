class User < ApplicationRecord

  CANDIATE_ROLE=0
  HR_ROLE=1

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages

  def hr?
    role == HR_ROLE
  end

end
