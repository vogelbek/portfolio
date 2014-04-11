class Devise::OmniauthCallbacksController < ApplicationController
  def all
    admin = Admin.from_omniauth(request.env["omniauth.auth"])
    if admin.persisted?
      flash.notice = "#{admin.name}, you are signed in!"
      sign_in_and_redirect admin
    else
      session["devise.admin_attributes"] = admin.attributes
      redirect_to new_admin_registration_url
    end
  end
  alias_method :twitter, :all
end
