# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def user_logged_in?
    session[:user_id]
  end

  def get_options_for_countries(selected)
    options_from_collection_for_select(Country.find(:all, :order => "name"),
                                       'id', 'printable_name', selected)
  end

  def get_options_for_locations(obj, selected = -1, zero_entry = false)
    locs = Location.find(:all, :order => "country_id")
    if selected == -1
      locs = locs.select { |l|
        !obj.locations.include?(l)
      }
    end
    (zero_entry ? make_option(0, "none", selected) : "") + locs.inject("") { |options, loc|
      options += make_option(loc.id, loc.country.printable_name + " - " + loc.name, selected)
    }
  end

  private

  def make_option(value, text, selected)
    "<option value=\"" + value.to_s + "\"" +
      (value == selected ? " selected=\"selected\"" : "") +
      ">" + text + "</option>"
  end
end
