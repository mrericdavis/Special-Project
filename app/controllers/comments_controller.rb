class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    image = Image.find_by(id: params[:image_id])
   
    comment = Comment.new(
    text: params[:text],
    image_id: params[:image_id],
    user_id: current_user.id
   )
    comment.save
    account_sid = 'ACf6094df2d993d915227856a3914648ec' 
    auth_token = ENV['Text']
     
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.api.account.messages.create(
      :from => '+12247013572', 
      :to => '+12244400308', #relationship.followed.phone_number #string interpolation
      :body => "#{current_user.name} has left a comment on your photo" , 
    )
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
