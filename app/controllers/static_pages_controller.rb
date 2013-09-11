class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
      
      # Show all items, not just ones own.
      @feed_items = Micropost.all.paginate(page: params[:page])
    else
      @feed_items = Micropost.all.paginate(page: params[:page])
    end
    
  end
  def help
  end
  
  def about
  end
  
  def contact
  end
  
end
