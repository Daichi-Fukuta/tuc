class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def line
    callback_for(:line)
  end

  def google_oauth2
    callback_for(:google)
  end

  private

  def callback_for(provider)
    auth = request.env["omniauth.auth"]

    @user = User.find_or_create_by(provider: auth.provider, provider_uid: auth.uid) do |user|
      user.nick_name = auth.info.nick_name
      user.provider = auth.provider
      user.private_token = auth.credentials.private_token
      user.provider_uid = auth.uid
      user.email = "#{auth.provider}-#{auth.uid}@example.com"
      user.password = Devise.friendly_token[0, 20]
    end

    

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url

    end
  end
end
