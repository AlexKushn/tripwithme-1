class TripsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :trip_params

  # GET /trips
  def index
    @trips = Trip.includes(:users)
  end

  # GET /trips/1
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  def create
    @trip = current_user.trips.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      redirect_to trips_path
    else
      render :edit
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private
    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:start, :stop, :start_time,
      :price, :passengers, :description, :rating, comments_attributes: comment_params)
    end

    def comment_params
      [:id,:text, :_destroy, :author_id, :title]
    end
end
