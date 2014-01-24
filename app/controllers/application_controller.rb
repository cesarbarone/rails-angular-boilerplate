class ApplicationController < ActionController::API

  def warden
    env['warden']
  end
end
