module ApplicationHelper

  def login
    if user_signed_in?
      link_to( "Log Out", destroy_user_session_path, :method => :delete) 
    else
      link_to( "Log In", new_user_session_path) 
    end
  end

end
