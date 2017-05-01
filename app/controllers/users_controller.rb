class UsersController < ApplicationController

  def show
    render json: User.find(params[:id]).to_json(include: :bounces)
  end

  def create
    user = User.new(user_params)

    if user.save
      auth_token = JsonWebToken.encode(user_id: user.id)
      render json: {status: 'User created successfully', auth_token: auth_token}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)
      render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
