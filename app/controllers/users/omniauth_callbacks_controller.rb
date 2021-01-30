# frozen_string_literal: true

# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

#   def google_oauth2
#     @user = User.from_omniauth(request.env["omniauth.auth"])
#     if @user.persisted?
#       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
#       auth = request.env["omniauth.auth"]
#       @user.access_token = auth.credentials.token
#       @user.expires_at = auth.credentials.expires_at
#       @user.refresh_token = auth.credentials.refresh_token
#       @user.save!
#       sign_in(@user)
#       redirect_to tasks_path
#     else
#       session["devise.google_data"] = request.env["omniauth.auth"]
#       redirect_to new_user_registration_url
#     end
#   end
# end


class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end
end