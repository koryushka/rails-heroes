class UsersController < ApplicationController
  before_action -> { doorkeeper_authorize! }, only: [:current]

  def current
    render json: current_resource_owner
  end
end
