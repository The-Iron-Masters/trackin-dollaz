class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to "/login"
      end
  end

  def update
    @user = get_user
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.json { render json: {}, status: 202 }
      else
        format.json { render json: @user.errors, status: 422 }
      end
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number)
  end

  def get_user
    User.find(params[:id])
  end
end
