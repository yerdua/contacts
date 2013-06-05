class Token < ActiveRecord::Base
  attr_accessible :user_id, :value

  belongs_to :user

  before_create :generate_value

  private

    def generate_value
      self.value = SecureRandom.urlsafe_base64
    end
end
