class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile_user
  accepts_nested_attributes_for :profile_user, reject_if: :all_blank
        
  validates :first_name, :last_name, presence: true, length: { minimum:
  3 }, on: :update
   #atributo virtual 
  def full_name
    [self.first_name, self.last_name].join(' ')
  end
         
end
