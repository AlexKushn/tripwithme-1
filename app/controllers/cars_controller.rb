class CarsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :car_params

  # GET /cars
  def index
    @cars = Car.includes(:driver)
  end

  # GET /cars/1
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  def create
    @car = current_user.cars.new(car_params)

    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      redirect_to cars_path
    else
      render :edit
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:name, :sits)
    end
end
