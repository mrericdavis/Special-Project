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
    account_sid = 'ACf6094df2d993d915227856a3914648ec' 
    auth_token = ENV['Text']
     
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.api.account.messages.create(
      :from => '+12247013572', 
      :to => '+12244400308', #relationship.followed.phone_number #string interpolation
      :body => " Login to LitPics To See The Comment (#{current_user.name}) Left On Your Photo!!", 
    )
    render "show.json.jbuilder"
  end
end
