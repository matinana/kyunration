class Curator < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: [:twitter]

  def self.find_for_oauth(auth)
    curator = Curator.find_by(uid: auth.uid, provider: auth.provider)

    curator ||= Curator.create(
      uid: auth.uid,
      provider: auth.provider,
      email: Curator.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )

    curator
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
