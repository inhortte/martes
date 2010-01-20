# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def user_logged_in?
    session[:user_id]
  end

  def get_options_for_countries(selected)
    options_from_collection_for_select(Country.find(:all, :order => "name"),
                                       'id', 'printable_name', selected)
  end

  def get_options_for_locations(obj)
    Location.find(:all, :order => "country_id").select { |l|
      !obj.locations.include?(l)
    }.inject("") { |options, loc|
      options += "<option value=\"" + loc.id.to_s + "\">" + loc.country.printable_name + " - " + loc.name + "</option>"
    }
  end
end
