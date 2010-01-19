# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def user_logged_in?
    session[:user_id]
  end

  def get_options_for_countries(selected)
    options_from_collection_for_select(Country.find(:all, :order => "name"),
                                       'id', 'printable_name', selected)
  end

end
