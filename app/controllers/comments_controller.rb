class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    comment = Comment.new(
    text: params[:text],
    image_id: params[:image_id],
    user_id: current_user.id
   )
    comment.save
    image = Image.find_by(id: params[:image_id])
    redirect_to "/images/#{image.id}"
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
