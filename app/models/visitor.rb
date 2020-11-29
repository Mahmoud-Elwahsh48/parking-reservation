class Visitor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers

  def active_for_authentication?
    super && !deactivated
  end

  def destroy
    update_attributes(deactivated: true) unless deactivated
  end
end
