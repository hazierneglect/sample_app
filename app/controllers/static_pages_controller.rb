class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
      
    # Show all items, not just ones own.
    
    if params[:utf8] == '✓'
      search=  params[:q]
      #render search.to_s
      # =~ /Cats(.*)/
      #@feed_items = Micropost.where("title = ?", search)
      
      @feed_items = Micropost.find(:all, :conditions => ['title LIKE ?', '%'+search+='%'])#.paginate(page: params[:page])#.collect(&:title)
      require 'will_paginate/array'
      @feed_items = @feed_items.paginate(page: params[:page])
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
