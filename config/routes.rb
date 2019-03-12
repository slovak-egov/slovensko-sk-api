Rails.application.routes.draw do
  scope constraints: { format: :json } do
    namespace :admin do
      get :eform_sync, path: 'eform/sync'
    end

    get :health, to: 'health#index'

    if UpvsEnvironment.sso_support?
      get :login, to: 'upvs#login'
      get :logout, to: 'upvs#logout'

      scope 'auth/saml', as: :upvs, controller: :upvs do
        get :login
        get :logout

        post :callback
      end
    end

    scope :api do
      namespace :eform do
        get :status
        post :validate
      end

      namespace :sktalk do
        post :receive
        post :receive_and_save_to_outbox
      end

      if UpvsEnvironment.sso_support?
        namespace :upvs do
          get :assertion, constraints: { format: :saml }, path: 'user/info'
        end
      end
    end

    get '500', to: 'errors#internal_server_error'
  end
end
