class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :email_downcase

  validates :name, presence: true, length: { maximum: 50 }
 validates :email, presence: true, length: { maximum: 255 },
                                    uniqueness: { case_sensitive: true }


  private
    def email_downcase
      self.email.downcase!
    end
end
