class ItemsController < ApplicationController
  def index
    render json: Item.all, except: [:created_at, :updated_at], include: :user, status: :ok
  end
end
