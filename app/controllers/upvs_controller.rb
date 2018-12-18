class UpvsController < ApiController
  # TODO add support for more callback urls (get from param -> check against env -> store in session -> redirect on success)

  def login
    redirect_to url_for('/auth/saml')
  end

  def callback
    response = request.env['omniauth.auth']['extra']['response_object']
    scopes = ['sktalk/receive', 'sktalk/receive_and_save_to_outbox']
    token = Environment.obo_token_authenticator.generate_token(response, scopes: scopes)

    redirect_to login_callback_url(token)
  end

  # TODO do we want API tokens or UPVS tokens on logout?

  def logout
    Environment.api_token_authenticator.invalidate_token(params[:token])

    redirect_to logout_callback_url

    # TODO rewrite this: logout via IDP works, logout via SP signs out here but user remains signed in at IDP
    # if params[:SAMLResponse]
    #   UpvsEnvironment.assertion_store.delete(params[:key])
    #
    #   render status: :ok, json: { message: 'Signed out' }
    # else
    #   redirect_to url_for('/auth/saml/spslo')
    # end
  end

  private

  def login_callback_url(token)
    "#{Environment.login_callback_url}?token=#{token}"
  end

  def logout_callback_url
    Environment.logout_callback_url
  end
end
