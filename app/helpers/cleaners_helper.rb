module CleanersHelper
  def locations_list
    Location.all.map do |location|
      [location.title, location.id]
    end
  end
end
