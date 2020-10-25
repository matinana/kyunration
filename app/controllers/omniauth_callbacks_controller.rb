class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @curator = Curator.find_for_oauth(request.env['omniauth.auth'])

    if @curator.persisted?
      sign_in_and_redirect @curator, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_curator_registration_url
    end
  end
end
