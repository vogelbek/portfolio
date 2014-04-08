class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |admin|
      admin.provider = auth.provider
      admin.uid = auth.uid
      admin.name = auth.info.nickname
      admin.email = "#{admin.name}-CHANGEME@twitter.example.com"
    end
  end

  def self.new_with_session(params, session)
    if session["devise.admin_attributes"]
      new(session["devise.admin_attributes"], without_protection: true) do |admin|
        admin.attributes = params admin.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
