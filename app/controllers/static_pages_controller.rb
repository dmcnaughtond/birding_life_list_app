class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @sighting_record = current_user.sighting_records.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
end
