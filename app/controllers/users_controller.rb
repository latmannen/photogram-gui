class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index"})
  end

  def show
    #Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")
    
    matching_usernames = User.where({ :username => url_username})
    
    @the_user = matching_usernames.first

      render({ :template => "user_templates/show"})
  end

  def create
    #Parameters: Parameters: {"input_username"=>"cowmein"}

    input_username = params.fetch("input_username")

    a_new_user = User.new

    a_new_user.username = input_username

    a_new_user.save

    redirect_to("/users/" + input_username)
  end
  def update
    #Parameters: {"input_username"=>"hashslinger", "modify_id"=>"anisa"}

    old_username = params.fetch("modify_id")
    new_username = params.fetch("input_username")

    matching_users = User.where({ :username => old_username })

    the_user = matching_users.first


    the_user.username = new_username
    the_user.save

    redirect_to("/users/" + new_username)
  end

end
