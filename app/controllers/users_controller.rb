class UsersController < ApplicationController
  before_action :authenticate_user!

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
    password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created User!'
      redirect_to '/'
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
end
