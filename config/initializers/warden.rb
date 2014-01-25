Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :api_authentication
  manager.failure_app = lambda { |env| Api::SessionsController.action(:new).call(env) }

  Warden::Strategies.add(:api_authentication) do
    # I used action_dispatch... because params is empty
    def authenticate!
      user_email = env['action_dispatch.request.parameters']['email']
      user = User.where(email: user_email).first
      user_password = env['action_dispatch.request.parameters']['password']
      if user && user.authenticate(user_password)
        success! user
      else
        fail! "Could not log in"
      end
    end
  end
end
