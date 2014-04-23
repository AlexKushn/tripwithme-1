class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :user_params

  # GET /users
  def index
    @users = User.page(params[:page])
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :surname, :phone_num, :role, cars_attributes: car_params)
    end

    def car_params
      [:id,:car_name, :_destroy, :driver_id, :sit]
    end
end
