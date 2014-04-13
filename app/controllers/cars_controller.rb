class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  load_and_authorize_resource param_method: :car_params

  # GET /cars
  def index
    @cars = @user.cars.includes(:driver)
  end

  # GET /cars/new
  def new
    @car = Car.new
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

  private

      # Only allow a trusted parameter "white list" through.
      def find_user
        @user = User.find(params[:driver_id])
      end

      def car_params
        params.require(:car).permit(:name, :sits, :driver_id)
      end
end
