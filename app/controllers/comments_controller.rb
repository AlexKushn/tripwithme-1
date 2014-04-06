class CommentsController < ApplicationController

  load_and_authorize_resource param_method: :comment_params

  # GET /comments
  def index
    @comments = Comment.created_before(Time.now).includes(:author)
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = current_trip.comments.new(comment_params)

    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  private
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:title, :text, :author_id)
    end
end
