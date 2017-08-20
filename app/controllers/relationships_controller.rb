class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(
    follower_id: current_user.id , 
    followed_id: params[:followed_id],
     )
    relationship.save
    redirect_to "/users"
  end
end
