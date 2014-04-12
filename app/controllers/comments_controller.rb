class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_trip, except: [:assign]
  load_and_authorize_resource param_method: :comment_params

  def assign
    @comment = Comment.find(params[:id])
    @comment.update_column(:author_id, current_user.id)
    redirect_to comments_path(@comment.trip)
  end
  # GET /comments
  def index
    @comments = @trip.comments.created_before(Time.now)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  def create
    @comment = @trip.comments.new(comment_params)

    if @comment.save
      redirect_to trip_comments_path(@trip)
    else
      render :new
    end
  end

private
    # Only allow a trusted parameter "white list" through.
    def find_trip
      @trip = Trip.find(params[:trip_id])
    end

    def comment_params
      params.require(:comment).permit(:title, :text, :author_id)
    end
end
