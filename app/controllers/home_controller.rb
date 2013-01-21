class HomeController < ApplicationController
  def index
  	@aircraft = Aircraft.all
 
	  respond_to do |format|
	    format.html
	    format.json  { render :json => @aircraft }
	  end
  end
end
