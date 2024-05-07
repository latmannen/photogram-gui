class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index"})
  end

  def show
    #Parameters: {"path_username"=>"anisa"}
    url_photo = params.fetch("path_photo")

      render({ :template => "photo_templates/show"})
  end

end
