class Api::SessionsController < ApplicationController

  def new 
    render json: {message: 'se fufu'}, status: 401
  end
  def create
    warden.authenticate!
    render json: {message: 'success'}, status: 201
  end
end
