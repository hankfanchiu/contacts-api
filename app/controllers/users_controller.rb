class UsersController < ApplicationController
  def index
    render json: {'key' => 'value'}
  end

  def create
    render text: "Anything"
  end

  def show
    render json: params[:category]
  end
end
