class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
      
    # Show all items, not just ones own.
    
    if params[:utf8] == '✓'
      search= "\s*" + params[:q]
      #render search.to_s
      # =~ /Cats(.*)/
      #@feed_items = Micropost.where("title = ?", search)
      
      @feed_items = Micropost.where("title  ?", 'REGEXP \[a-zA-Z0-9_]*Regexp.escape(search)\[a-zA-Z0-9_]*' )
      #@feed_items = Micropost.where(CharIndex(search,"title"))
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
