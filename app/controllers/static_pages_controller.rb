class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
      
    # Show all items, not just ones own.
    

      @feed_items = Micropost.all.paginate(page: params[:page])
    
  end
  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def results
    
    # Implimentation allows spaces between terms
    @feed_items = []
    search = params[:q].split(' ')
    search.each do |st|
      @feed_items += Micropost.find(:all, :conditions => ['title LIKE ?', '%'+st+'%'])
    end
    
    # Prevents duplicates. hehe.
    @feed_items.uniq!
    
    require 'will_paginate/array'
    @feed_items = @feed_items.paginate(page: params[:page])  
    @searchtitle = params[:q]
  end
  
end
