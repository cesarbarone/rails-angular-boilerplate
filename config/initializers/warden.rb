Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :api_authentication
  manager.failure_app = lambda { |env| Api::SessionsController.action(:new).call(env) }

  Warden::Strategies.add(:api_authentication) do
    def authenticate!
      user = User.where(email: params['email']).first
      if user && user.authenticate(params['password'])  
        success! user
      else
        fail! "Could not log in"
      end
    end
  end
end
