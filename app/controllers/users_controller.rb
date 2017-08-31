class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home, :new, :create]

  def index
    if current_user
      @users = User.where.not(id: current_user.id)
    else
      @users = User.all
    end
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    avatar: params[:url],
    password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created User!'
      redirect_to '/images'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    render "edit.html.erb"
  end

  def update
    render "update.html.erb"
  end

  def destroy
    render "destroy.html.erb"
  end

  def home
    render "home.html.erb", layout: "home.html.erb"
  end

  def friend
    @users = current_user.following
    # @images = Image.all.reverse
    @images = []
    @users.each do |user|
      user.images.each do |image|
        @images << image
      end
    end
    @images.sort_by { |image| image.created_at }
    render "friend.html.erb"
  end
end
