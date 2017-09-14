class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(
    follower_id: current_user.id , 
    followed_id: params[:followed_id],
     )
    relationship.save
       
    account_sid = 'ACf6094df2d993d915227856a3914648ec' 
    auth_token = ENV['Text']
     
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.api.account.messages.create(
      :from => '+12247013572', 
      :to => '+12244400308', #relationship.followed.phone_number #string interpolation
      :body => "#{current_user.name} has decided to follow you on Lit-Pics" , 
    )
    redirect_to "/users"
  end
end
