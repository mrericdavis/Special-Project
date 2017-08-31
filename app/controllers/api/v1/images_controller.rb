class Api::V1::ImagesController < ApplicationController
  def index
    @images = Image.all
    render "index.json.jbuilder"
  end

  def show
    @image = Image.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @image = Image.new(
      text: params[:form_text],
      user_id: current_user.id,
      image_id: current_image.id,
    )
    @image.save
    render "show.json.jbuilder"
  end
end
