class User < ApplicationRecord
  before_save :email_downcase

  validates :name, presence: true, length: { maximum: 50 }
 validates :email, presence: true, length: { maximum: 255 },
                                    uniqueness: { case_sensitive: true }


  private
    def email_downcase
      self.email.downcase!
    end
end
