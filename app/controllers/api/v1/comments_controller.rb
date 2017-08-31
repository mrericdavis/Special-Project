class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render "index.json.jbuilder"
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @comment = Comment.new(
      text: params[:form_text],
      user_id: current_user.id,
      image_id: params[:form_image_id],
    )
    @comment.save
    render "show.json.jbuilder"
  end
end
