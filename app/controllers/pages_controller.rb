class PagesController < ApplicationController
  
  def home
	@title = "Home"
	if signed_in?
		@micropost = Micropost.new
		@feed_items = current_user.feed.paginate(:page => params[:page])
	end
  end
  
  def rss
    latest
	render :layout => false
  end
    
  def basketballfeed
	@title = "Basketball Feed"
	if signed_in? 
		@feed_items = current_user.basketball_feed.paginate(:page => params[:page])
	end
  end
		
  def footballfeed
	@title = "Football Feed"
	if signed_in?
		@feed_items = current_user.football_feed.paginate(:page => params[:page])
	end
  end
  
  def soccerfeed
    @title ="Soccer Feed"
	if signed_in?
		@feed_items = current_user.soccer_feed.paginate(:page => params[:page])
	end
  end
  
  def austinbasketballfeed
	@title="Austin Basketball"
	if signed_in?
		@feed_items = current_user.austinbasketball_feed.paginate(:page => params[:page])
	end
  end
  
   def atlantabasketballfeed
	@title="Atlanta Basketball"
	if signed_in?
		@feed_items = current_user.atlantabasketball_feed.paginate(:page => params[:page])
	end
	end
	
  
  def bostonbasketballfeed
	@title="Boston Basketball"
	if signed_in?
		@feed_items = current_user.bostonbasketball_feed.paginate(:page => params[:page])
	end
	end
  
  def dcbasketballfeed
	@title="DC Basketball"
	if signed_in?
		@feed_items = current_user.dcbasketball_feed.paginate(:page => params[:page])
	end
	end
	
  def nycbasketballfeed
	@title="NYC Basketball"
	if signed_in?
		@feed_items = current_user.nycbasketball_feed.paginate(:page => params[:page])
	end
	end
		
	def phillybasketballfeed
	@title="Philadelphia Basketball"
	if signed_in?
		@feed_items = current_user.phillybasketball_feed.paginate(:page => params[:page])
	end
	end
	
	def richmondbasketballfeed
	@title="Richmond Basketball"
	if signed_in?
		@feed_items = current_user.richmondbasketball_feed.paginate(:page => params[:page])
	end
	end
  
  def wilmingtonbasketballfeed
	@title="Wilmington Basketball"
	if signed_in?
		@feed_items = current_user.wilmingtonbasketball_feed.paginate(:page => params[:page])
	end
  end
  
  
  def austinfootballfeed
	@title="Austin Football"
	if signed_in?
		@feed_items = current_user.austinfootball_feed.paginate(:page => params[:page])
	end
  end
 
   def atlantafootballfeed
	@title="Atlanta Football"
	if signed_in?
		@feed_items = current_user.atlantafootball_feed.paginate(:page => params[:page])
	end
	end
	
  def bostonfootballfeed
	@title="Boston Football"
	if signed_in?
		@feed_items = current_user.bostonfootball_feed.paginate(:page => params[:page])
	end
	end
 
  def dcfootballfeed
	@title="DC Football"
	if signed_in?
		@feed_items = current_user.dcfootball_feed.paginate(:page => params[:page])
	end
	end
	
  def nycfootballfeed
	@title="NYC Football"
	if signed_in?
		@feed_items = current_user.nycfootball_feed.paginate(:page => params[:page])
	end
	end
	
	def phillyfootballfeed
	@title="Philadelphia Football"
	if signed_in?
		@feed_items = current_user.phillyfootball_feed.paginate(:page => params[:page])
	end
	end
	
	def richmondfootballfeed
	@title="Richmond Football"
	if signed_in?
		@feed_items = current_user.richmondfootball_feed.paginate(:page => params[:page])
	end
	end
  
  def wilmingtonfootballfeed
	@title="Wilmington Football"
	if signed_in?
		@feed_items = current_user.wilmingtonfootball_feed.paginate(:page => params[:page])
	end
  end


  def austinsoccerfeed
	@title="Austin Soccer"
	if signed_in?
		@feed_items = current_user.austinsoccer_feed.paginate(:page => params[:page])
	end
  end
 
   def atlantasoccerfeed
	@title="Atlanta Soccer"
	if signed_in?
		@feed_items = current_user.atlantasoccer_feed.paginate(:page => params[:page])
	end
	end
	
  def bostonsoccerfeed
	@title="Boston Soccer"
	if signed_in?
		@feed_items = current_user.bostonsoccer_feed.paginate(:page => params[:page])
	end
	end
 
  def dcsoccerfeed
	@title="DC Soccer"
	if signed_in?
		@feed_items = current_user.dcsoccer_feed.paginate(:page => params[:page])
	end
	end
	
  def nycsoccerfeed
	@title="NYC Soccer"
	if signed_in?
		@feed_items = current_user.nycsoccer_feed.paginate(:page => params[:page])
	end
	end
	
	def phillysoccerfeed
	@title="Philadelphia Soccer"
	if signed_in?
		@feed_items = current_user.phillysoccer_feed.paginate(:page => params[:page])
	end
	end
	
	def richmondsoccerfeed
	@title="Richmond Soccer"
	if signed_in?
		@feed_items = current_user.richmondsoccer_feed.paginate(:page => params[:page])
	end
	end
  
  def wilmingtonsoccerfeed
	@title="Wilmington Soccer"
	if signed_in?
		@feed_items = current_user.wilmingtonsoccer_feed.paginate(:page => params[:page])
	end
  end
  
  def contact
	@title = "Contact"
  end

  def about
	@title = "About"
  end
  
  def help
	@title = "Help" 
  end
end
