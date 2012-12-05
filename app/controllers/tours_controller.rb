class ToursController < ApplicationController

 
   # Note: @target_folder is set in require_existing_target_folder
  def new
    @tour = Tour.new(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  # Note: @target_folder is set in require_existing_target_folder
  def create
     @tour = Tour.create(params[:tour])
     @tour.published=false
     @tour.save!
     respond_to do |format|
      format.html {render 'sessions/profile'}
      format.js
     end
    #  
    #if @foldesr.save
    #  redirect_to(:controller=>:sessions, :action=>:profile, :user_id=>current_user.id)
    #else
    #  render :action => 'new'
    #end
  end
  def show
    #@tour = current_user.tours.first
    @tour = current_user.tours.find(params[:tour_id])
    @sites = @tour.sites.to_json
  end

  def gen_xml
    if current_user == nil
      current_user = User.find(params[:user_id])
    end
    @tours=current_user.tours
    xml = Builder::XmlMarkup.new
    xml.instruct!
    xml.tours do
      @tours.each { |tour|
        if tour.published == true
        
          xml.id tour.id
          xml.name tour.name
          xml.size tour.size
          xml.desc tour.desc
          xml.url tour.zipurl
        
        end
      }
    end
    
    respond_to do |format|
      format.xml { render :xml => xml.target! }
      format.html { render :layout => false }
    end
  end
  
  def zip_tour
    
  end
  
  def publish
    tour = Tour.find(params[:tour_id])
    tour.published = true
    tour.save!
    respond_to do |format|
      format.html {render 'sessions/profile'}
      format.js
    end
    
  end
  
  def unpublish
    tour = Tour.find(params[:tour_id])
    tour.published = false
    tour.save!
    respond_to do |format|
      format.html {render 'sessions/profile'}
      format.js
    end
  end
  
  def public_list
    
  end
  

end