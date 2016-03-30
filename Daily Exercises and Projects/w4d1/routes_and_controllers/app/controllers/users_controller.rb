class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(params[:user].permit(:username))

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    # user = User.find_by(params[:user].permit(:id))
    if user
      render json: user
    else
      render text: "User not found"
    end
  end

  def update
    user = User.find_by(id: [params[:id]])

    if user.update(user_params)
      rendern json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: [params[:id]])

    if user.detroy
      rendern json: user
    else
      render json: "Can't destroy this user"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end
