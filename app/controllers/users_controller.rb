class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  def show
    user = find_user
    render json: user,  except: [:created_at, :updated_at], include: :items, status: :ok
  end

  private

  def find_user
    User.find(params[:id])
  end

  def render_not_found_response
    render json: {error: "User not found"}, status: :not_found
  end

end
