class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  load_and_authorize_resource param_method: :car_params

  # GET /cars
  def index
    @cars = Car.includes(:driver)
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  def show
    @cars = Car.includes(params[:driver_id])
  end

  def edit
  end

  # POST /cars
  def create
    @car = @user.cars.new(car_params)
    if @car.save
      redirect_to user_cars_path(@user)
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to user_path(@user)
  end


  private

      # Only allow a trusted parameter "white list" through.
      def find_user
        @user = User.find(params[:user_id])
      end

      def car_params
        params.require(:car).permit(:car_name, :sit, :driver_id)
      end
end
