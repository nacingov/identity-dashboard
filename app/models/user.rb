class User < ActiveRecord::Base
  devise :trackable, :omniauthable, omniauth_providers: [:saml]
  has_many :applications

  before_create :create_uuid

  def create_uuid
    if self.uuid.empty?
      self.uuid = SecureRandom.uuid
    end
  end
end
