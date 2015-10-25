class FavoritesController < ApplicationController
  before_action :logged_in_user
  
  def create
    @feed_item = Micropost.find(params[:favorite][:favoritepost_id])
    current_user.favorites.create(favoritepost_id: @feed_item.id)
    redirect_to root_url
  end

  def destroy
    @feed_item = current_user.favorites.find(params[:id]).favoritepost
    current_user.favorites.find_by(favoritepost_id: @feed_item.id).destroy
    redirect_to root_url
  end
  
  def favorite
    @favoriteposts=current_user.favorite_userposts
  end
end
