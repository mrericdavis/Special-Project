class ImagesController < ApplicationController
  def index
    @users = User.all 
    @images = Image.all
    render "index.html.erb"
  end
  
  def new
    @user = User.find_by(params[:id])
    render "new.html.erb"
  end  
  def create
    image = Image.new(
      title: params[:title],
      url: params[:url],
      description: params[:description],
      user_id: current_user.id
    )
    image.save
    redirect_to "/"   
  end

  def show
    @image = Image.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
  end

  def update
  end

  def destroy
    @images = Image.find_by(id: params[:id])
    @image.delete
    flash[:danger] = "image Succesfully Destroyed"
    redirect_to "/images"
  end
end
