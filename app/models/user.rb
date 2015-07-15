class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 , maximum: 14}

  has_many :places, foreign_key: :host_id, dependent: :destroy

  has_secure_password

  before_create :create_remember_token

  class << self
    def generate_remember_token
      SecureRandom.urlsafe_base64
    end

    def digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  end

  private
  def create_remember_token
    self.remember_token = User.digest(User.generate_remember_token)
  end
end
