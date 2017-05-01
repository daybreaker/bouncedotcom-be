class BouncesController < ApplicationController
  before_filter :authenticate_request!, only: [:create, :destroy]

  def index
    render json: Bounce.order(created_at: :desc).limit(10)
  end

  def show
    render json: Bounce.find(params[:id])
  end

  def create
    bounce = Bounce.new(bounce_params)

    if bounce.save
      render json: { status: 'Bounce created successfully' }, status: :created
    else
      render json: { errors: bounce.errors.full_messages }, status: :bad_request
    end
  end

  private

  def bounce_params
    params.require(:bounce).permit(:user_id, :cloudinary_id, :title)
  end
end
