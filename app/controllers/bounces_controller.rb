class BouncesController < ApplicationController
  before_filter :authenticate_request!, only: [:create, :destroy]

  PER_PAGE = 15

  def index
    page = params[:page] ? params[:page] : 1
    bounces = Bounce.order(created_at: :desc).page(page).per(PER_PAGE)
    render json: {
      bounces: bounces,
      all_bounces_count: Bounce.count,
      this_page_total: bounces.count
    }
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
    params.require(:bounce).permit(:user_id, :cloudinary_id, :title, :media_type)
  end
end
